Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE521791BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 14:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729502AbgCDNwN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 08:52:13 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44611 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729175AbgCDNwN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 08:52:13 -0500
Received: by mail-ot1-f65.google.com with SMTP id v22so2016234otq.11;
        Wed, 04 Mar 2020 05:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qQOF9a77DkYN+M16VKtWXM6y6D5BVTz+s8YOSqDRBrk=;
        b=kikMLeFDvfSKBDBstzvETiUZKgaIoOEan9w43hzXQpxf/L4niKGZ4DDUQurwh4Ts15
         RXCS+lbU6NfMV1QhsQxvIH24gYczWGykTCdWrl3d76PhdTEmF+VKAY0MH/nlPZaWBiOT
         OHormQLy53lBhgmphltoEW6AFT6ySdEweGF0iinVsetqx9fv8F2k0xssJdQP2HDpnQVC
         Su3JMosD4MeZmpcjwu8Pdi4Q7lHxGrpoTVDkZJ+MDfaXlrKqfHbjc1izi2zqFeJapOAV
         Vgr72JOQXZLH6AN0ksvtHZtaQbbBFO5mxK7eN0hH1H2FPCzpX8tn5e0PggRe4ZB6ETu2
         TwKg==
X-Gm-Message-State: ANhLgQ1dwlS+Z1y5Chz+46hxnQic3JY6BHsYiOtQL+BDRyAhj2MSrrPV
        b4xkhyN+mnJ0kL7NFj2Q9S3bqIWTAxOUxxPHKQg=
X-Google-Smtp-Source: ADFU+vsqprMBKJBNanQU3o9XUsIuDWOmHxBPn7SmAq5y662+Hs/9Avrf7/Z3l1SB9xJRXYEOru+uYY5S8Nb63GRefqI=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr2400848ots.250.1583329932180;
 Wed, 04 Mar 2020 05:52:12 -0800 (PST)
MIME-Version: 1.0
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1583304137-28482-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1583304137-28482-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Mar 2020 14:52:01 +0100
Message-ID: <CAMuHMdVvawvuyksuneNgsVXteK3q_n=W63Hotnx9X+ce33c0XQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 4, 2020 at 7:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This hardware needs to enable clocks of both host and peripheral.
> So, this patch adds multiple clocks management.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
