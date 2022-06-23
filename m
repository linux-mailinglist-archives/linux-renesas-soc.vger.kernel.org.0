Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E822558AEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jun 2022 23:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiFWVqo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jun 2022 17:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiFWVqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jun 2022 17:46:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63455DF11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jun 2022 14:46:42 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 23so631046pgc.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jun 2022 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=tc/9GhMGILH31U9N9aM0UY6agRe2uFnep9S8pLV/Yuc=;
        b=JTE+CyWpvRTlXxiI2FBDyNWl1yHBEm27aaw6Ig16j4JiXhMcJE6tJqiRpffSMguLU/
         MXVnW7L3BR66wMo+YnBSIdq687N+Wau93Q34JfD5TtOlcm+xvzr7o/lTa6vnAK+om+IT
         ocw2wLQzOlhRI7sIhodupV95E8hjELCpsxdqKkq05OIOG+td/gqg5XsBxB5F6oxGo3Fu
         oWkrljudLIoQ/1oESuaLFoEy+VTIU4men3FtMPc+M/0Ju4nPWtJ7SrBRgAeKXhRkB2tD
         34Tj8iENpTTTAJnnZg9PCOk5ybSkpQw3+lCphW8s6Xk5nOLVaQNKs6Dd88nGTbAhJzgp
         t9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=tc/9GhMGILH31U9N9aM0UY6agRe2uFnep9S8pLV/Yuc=;
        b=Jd77vcwkF7UbTRcoEGoUMvD2llmu2IBB2I2oS9HNQMCKYCJPL2WBIIXqxs3ZN99opg
         CHY4ltmtZbBvbP3bzul3uM2SEk73NKV8UkMzdww5RysWRY8wwUEjuxKAyAX0qFjYLiSj
         fffSgnxK4RtQz7qkoOFWV7JzWcUIBzZCPgXmrHRFyTBAHiwWU19o9KKXuFZOD/EZwLT6
         q29x8PWi3H/FI6pGxBAWl0UZOT7+L+mzWV2dQwxCxytWp+o6DR/CJDLYqXMmCSQ+b0Ot
         ZbNhiU6B43iCO/zNHbd9uUer8UVqjMXiVxF+X7YLvc4gi7Tq3gZm2yBb43LYy9WGK//N
         07/Q==
X-Gm-Message-State: AJIora+01+SmMo3/IF0HEhvcQFOSV5Ssn5woUfrR68lzna6D2cePqqC+
        VydlwcgO3k1ZyxuJ0iFZ1/F3uup/TRrE6VHf0B4=
X-Google-Smtp-Source: AGRyM1t9ENSv7lRSggXHK396mhnL48WfPtHZRh5fT49CPMS6piHe+9+7d//GX3VL6qXLVKJljR5rBhSsOFpFrJpDk2U=
X-Received: by 2002:a63:2483:0:b0:40d:7d66:a86e with SMTP id
 k125-20020a632483000000b0040d7d66a86emr879586pgk.161.1656020802446; Thu, 23
 Jun 2022 14:46:42 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: souleyyaye409@gmail.com
Received: by 2002:a05:6a21:99a6:b0:83:f430:3683 with HTTP; Thu, 23 Jun 2022
 14:46:42 -0700 (PDT)
From:   Kayla Manthey <sgtkalamanthey@gmail.com>
Date:   Thu, 23 Jun 2022 14:46:42 -0700
X-Google-Sender-Auth: LinSfCCLwwd_fuUYeEE9dieyGPc
Message-ID: <CAHUK_Pq0_5O1AN42Wb+u+_D01fNtYD7dM2aZWiv6Rjog0c61iw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pozdrav jesi li dobio moje mailove? molim provjerite i odgovorite mi
