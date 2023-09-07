class Janken_hoi

    def start_janken
        @is_atimuitehoi = false #あっち向いてほいか（選択肢の文字列変換の切り替えに使用）
        puts "じゃんけん..."
        puts "0(グー)1(チョキ)2(パー)3(戦わない)"

        gets_choice

        puts "ホイ！"
        puts "---------------"

        play_janken_result(@user_choice)
    end
        
    def gets_choice #ユーザの選択肢を取得する
        @user_choice = gets.to_i #入力値を取得して、文字列を数値へ変える
        @partner_choice = (0..2).to_a[rand(3)] #0〜2までの数値をランダムに1文字取得する
        
        if @is_atimuitehoi == false #じゃんけんをしてるなら
            @user_choice = change_choice_janken(@user_choice) #数値を文字列へ変換
            @partner_choice = change_choice_janken(@partner_choice)
        else #あっち向いてほいをしてるなら
            @user_choice = change_choice_atimuitehoi(@user_choice) #数値を文字列へ変換
            @partner_choice = change_choice_atimuitehoi(@partner_choice)
        end
    end

    def change_choice_janken(choice) #じゃんけんの手を文字列に変換する
        case choice
        when 0
        return "グー"
        when 1
        return "チョキ"
        when 2
        return "パー"
        when 3
        return "戦わない"
        else
        return nil #0~3以外の入力の時、nilを返す
        end
    end

    def play_janken_result(user_choice) #じゃんけん挑戦結果
        if @user_choice == "戦わない" #ユーザーの選択肢が「戦わない」なら停止する
            puts "戦わない"
            return
        elsif @user_choice.nil? #選択肢以外を選択されていたら停止する
            puts "選択肢から選んでください"
            return
        end
        
        puts "あなた：#{@user_choice}を出しました"
        puts "相手：#{@partner_choice}を出しました"
        puts "---------------"

        if @user_choice === @partner_choice #じゃんけんがあいこならあいこする
            continue_janken 
        elsif @user_choice != @partner_choice #じゃんけんがあいこじゃないならあっち向いてほいをする
            play_atimuitehoi
            play_atimuitehoi_result(@user_choice)
        end
    end

    def continue_janken #あいこ関数
        puts "あいこで..."
        puts "0(グー)1(チョキ)2(パー)3(戦わない)"

        gets_choice

        puts "しょ！"
        puts "---------------"

        play_janken_result(@user_choice)
    end

    def play_atimuitehoi #あっち向いてほい関数
        @is_atimuitehoi = true
        puts "あっち向いて..."
        puts "0(上)1(左)2(右)"

        gets_choice

        puts "ホイ！"
        puts "---------------"
    end

    def change_choice_atimuitehoi(choice) #あっち向いてほいの手を文字列に変換する
        case choice
        when 0
        return "上"
        when 1
        return "左"
        when 2
        return "右"
        else nil
        end
    end

    def play_atimuitehoi_result(user_choice) #あっち向いてほい挑戦結果
        if @user_choice.nil? #選択肢以外を選択されていたら停止する
            puts "選択肢から選んでください"
            return
        end

        puts "あなた：#{@user_choice}"
        puts "相手：#{@partner_choice}"
        puts "---------------"
        start_janken
    end

end

janken_hoi = Janken_hoi.new
janken_hoi.start_janken