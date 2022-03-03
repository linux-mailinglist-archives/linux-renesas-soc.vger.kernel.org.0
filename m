Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DDE4CBA23
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 10:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiCCJ0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiCCJ0B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:26:01 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C5847AC1;
        Thu,  3 Mar 2022 01:25:16 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f37so7313049lfv.8;
        Thu, 03 Mar 2022 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q6dWyOSxtQaqc6rOdj1kSMlaHNYdY8a6NUWiCmzKlBU=;
        b=Wu6azQb51NeYK2nXdZ4c+57Tqdxw0f2J8bT9gGTqou+kF7sYbWqIZLP3Wzt07AsRwk
         FoZsY71KojwkB5vzjVg0Td/eX5chuwVl0W7NQABSIJ7nMUGUpRkwfVjsjR75gHAqw0Td
         SJ2x3c6uuU0GR89MPXsPmqV/G8jrclkAArWz4nyeuuBUzYcwlE4iuqBLJkdYwwginf2M
         EpMqc2x3y99e5Gx80k2nVM4ofj24hnzyy93TMGSPnnL+TVvno8m85/9E+9gXo+J0gXRr
         y8xKY9HQRwqDiuk/M1VUvnl6q8Kh0lu4dqi2wQQ6422/HJ7CpexWGZG3EkUZTN3rtDTw
         5cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6dWyOSxtQaqc6rOdj1kSMlaHNYdY8a6NUWiCmzKlBU=;
        b=hpcrw021P9QCt2SAZVnOY5Ay5WU0H3/4WXXIvWJig6ElThSflGxO7q0FrKmpI/JLr4
         lI2gSSzsxare/5VdZcdliJJbykBUNQKjFVh4kKZ5LdLI1h9Ghql6LSWcloKWXVrDtTIW
         xVjPMOfA0pQxkAsbzqV3c7G+GhLTfQQ4LdSvrgL2jIQf0lPxyYbt+0uOBP/jhFF4ng3O
         CDqVdaWwq6hcI/SymwQ9laNIMrkcRbp2Lbe7Qe/qFhn3Waqbst1ae5IUBgB7UW67szuk
         SHe4w4zTWNGOrYlBWElKpPPvDK1Mp+E60NDyF5O6vstQhpv3Au1l8Z2AljxmD/84p5Nt
         q8Kg==
X-Gm-Message-State: AOAM532geIddcbvIfZbAaeRTpqtfPEgrX84MPN19ix6AfLFdXKTFvLIJ
        a54C2GHo8HEp6wVtOHpC8kY=
X-Google-Smtp-Source: ABdhPJx8KZKR+FK3NQRCubIjKos2NSeV9iIUKZ41fLvSBPNb/4w/2u6vpuX6J8ZLgwoPKvHczRqKCA==
X-Received: by 2002:ac2:5963:0:b0:442:eff6:4219 with SMTP id h3-20020ac25963000000b00442eff64219mr20886948lfp.56.1646299514385;
        Thu, 03 Mar 2022 01:25:14 -0800 (PST)
Received: from [192.168.1.103] ([31.173.85.105])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e3203000000b0024630256cdbsm354462ljy.58.2022.03.03.01.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 01:25:13 -0800 (PST)
Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort
 the nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
 <20220302103301.23852-2-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <98b0cafb-4f0b-5e4c-72b0-a0983d0ff493@gmail.com>
Date:   Thu, 3 Mar 2022 12:25:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220302103301.23852-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 3/2/22 1:32 PM, Biju Das wrote:

> Sort the pinctrl nodes alphabatically.

   Alphabetically. :-)
   Could prolly be fixed while applying...

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[...]

MBR, Sergey
