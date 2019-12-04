Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0B71127E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfLDJjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:39:25 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44248 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfLDJjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:39:25 -0500
Received: by mail-ot1-f68.google.com with SMTP id x3so5711851oto.11;
        Wed, 04 Dec 2019 01:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r68woAwhCK1qjFF8W9blpfPBitT2ZWsac1/qcNxzMBY=;
        b=XptLqZQJoF1E8jog71oZ2tcZnb3o1R3gqREyzYjm3k32rIw7gI4Bm+LAN0bkCOLi8l
         a1ubAjz9spsoKn48gEF0EmcX/EWUzFZe+++yKbTOazs9PXV3rCgF4FCMd8xrp4AyOEif
         CcYyhtK4JltHOhcSfPax4PSKszwyYWI62XCsZtBGAU8vJ2tEEjEN3HvGqOGvcAWApWH9
         uVidA8xYqMlbuv3nUc6J1FlGfMAKljrPVraCrUwF2+6pQEkeKB6KidO7UECFsoAvEedW
         CZFPk8Z17BLEGmm8OedoiRSr4HL+8DQAJmw/6ZMxdEyUike2VL+dd+RMw5RT84WFJA6s
         ZaoA==
X-Gm-Message-State: APjAAAVWrtsrvdG5H8c/8Q0Q26x4mL+2zc3p9EtuYzCxDs0c9LYs1eM/
        P60v5m1KV7LtX6tVUgg3KiyV/s+JLKMV2b1bvLE=
X-Google-Smtp-Source: APXvYqxb2OvuzOjZVhu0BXxZhKn56TcEFB2YErS0vprOPsHa+8jbt0OFR6jWY/B7Q4BHNY7rYPOOWRjrxlvW6Ox22F4=
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr1780277oti.250.1575452363034;
 Wed, 04 Dec 2019 01:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com> <20191203203301.2202-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203203301.2202-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:39:11 +0100
Message-ID: <CAMuHMdXkO0Vb5q+3xfdV6tdcQX0avEocVOihbC-xZgqpwsMHpw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: enfore manual correction for Gen3
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

enforce?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
