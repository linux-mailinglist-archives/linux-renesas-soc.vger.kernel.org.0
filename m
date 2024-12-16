Return-Path: <linux-renesas-soc+bounces-11383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78E9F31F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6EB1885434
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444E9204F88;
	Mon, 16 Dec 2024 13:51:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D831204C06;
	Mon, 16 Dec 2024 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734357099; cv=none; b=ELZX96d7hNs4qGSek1/Dhz3hyS+vuGbwA2Dh5TGRqcMi5pbohWRNGmIrNGd3JfefF/ZmrKUhTAxQvy/TXdap8/3iNTNHAHrhnTqWDfe8MQ6BkNzOV921IPyrDTMFOi5/ihOXB1FULi2onloVPN4fvPUiUZWnu68G0zbKPZB8aps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734357099; c=relaxed/simple;
	bh=8x2L09lnocR+Uoe4fNo3fNuvBbW5Bk32u8o4EJ9xf6U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OAhyKZsics3zcnFEiiv76z7ifxYhusxYkCXYI4ALazDzg3yEpW9HnTltmqty2iT382lQr4Do8QOGarZKUpCuLN7+r7m7espFSwpL/XK9QoEnPFCv2haaR7f/asiDMaZl5tg904+yjKrOqbRmr1KzFDVps3sqqxs7/08EhT8QSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so1095050e0c.1;
        Mon, 16 Dec 2024 05:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734357096; x=1734961896;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTDfWhCbHbVmOB07ibdDH37/ZARtk6zjlChlh/Lqxpw=;
        b=MA11GjONxxUE76Wy+iuddtPOqNyoEc69vCeYsRgYu/BKJrtuUSaiLPPZUsHHampvB0
         czSpVn1FoF7sAfGYzmON0ZouPW0rZinaEeuEEvpw+mjQT3KjtuzBC2fBkclfHm6OxfIn
         9tbY0gXLeCgpz+eGmZCRKMdtWklocRqJHfaunfiOAe347rZxQCASTY5AP3Z8dNZpdawf
         9YuTzwrp0jRawxK3zWMLWbzXH/wgbJOmhCulpbbyeA4mY9kCiF0ZDOcvQysvfk71acdn
         adr0HhqX9oLYicIJoqATLvgz6TZ8yXyRT5MDcoNeFEAFoQvtO/6LFcqn6W08hUkSN4j8
         9BjA==
X-Forwarded-Encrypted: i=1; AJvYcCW3qWy1+cPFtHHIg8RTtYVhGJmzReYQGX9HO5yTXp8bCVv+Uf81WDbCIMQJtzAMDLz9YI4c0PPjhTadFDWthLllxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdno8HJwyOymYz27phUZwRWgmj69pFZ5NF93FUVZcm5UcYvbal
	0Au4RoLZoLSQGQa9nnV2MmJgzPNeU+NyNOStTy3mRCEaRs7u9oKvVjfblIsB
X-Gm-Gg: ASbGncs+5ym7pXSbhDD6FGeHibcEN+lgLRuaOfessfyhoKJuVrl/5ya8QQYNj/xFFtJ
	nGDO0k5Riqp/IpTqow8NOd2dotY3pwaBtAWZL87GbSkC2vzK50ohlHv2Z4su48cg913UifrSWX+
	+NxUO8bvlDTPLo/y0Cz2hxVTt2cllaZZ/TLtEzEkPMuA3K0EwciwQE9HHtVajqksN9dtVkbQCTV
	LeOEmN7d05CxLpwGPJddhjIRaln1nIHYF2106fYnfWpFdiy1sNToUgO0bd+GVxNDPOWppYiIsAn
	ZjHCreSF0/BlvBGoh8c=
X-Google-Smtp-Source: AGHT+IH48wzOuwxnqg2gdDOP/wNXnDmFiYLgvcmvp5e+39Pj0Yj2rpb00Xl1zaxMarh+lJ4qYtOL1w==
X-Received: by 2002:a05:6102:1629:b0:4b1:2010:5cd7 with SMTP id ada2fe7eead31-4b25d9a33efmr11078782137.8.1734357095703;
        Mon, 16 Dec 2024 05:51:35 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2701f9906sm836396137.3.2024.12.16.05.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:51:35 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso735426241.2;
        Mon, 16 Dec 2024 05:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2tWP1i7QvhNoH8t9xREEGV5Czwdm98ClwKT4KVVBCOYT6LBHvBZwaL1s5zwk24DeQfO81XYZuj3judyIUOwu9KQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4b08:b0:4af:a216:c0d0 with SMTP id
 ada2fe7eead31-4b25d73645dmr13627305137.0.1734357095233; Mon, 16 Dec 2024
 05:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 14:51:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com>
Message-ID: <CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com>
Subject: rsnd_adg_clk_control() sometimes disables already-disabled clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Once in a while, I see the following warning on Salvator-X(S) when entering
s2idle[1]:

    ------------[ cut here ]------------
    clk_multiplier already disabled
    WARNING: CPU: 0 PID: 1084 at drivers/clk/clk.c:1194
clk_core_disable+0xd0/0xd8
    CPU: 0 UID: 0 PID: 1084 Comm: s2idle Not tainted
6.13.0-rc3-arm64-renesas-01336-g13a53d27900d #2738
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : clk_core_disable+0xd0/0xd8
    lr : clk_core_disable+0xd0/0xd8
    sp : ffff800083a8ba00
    x29: ffff800083a8ba00 x28: ffff0004ca7e1a40 x27: ffff800081a0a968
    x26: ffff8000825ee000 x25: ffff800081ae0090 x24: 0000000000000000
    x23: ffff0004c0d64500 x22: 0000000000000000 x21: ffff0004c0d64480
    x20: ffff0004c32c5800 x19: ffff0004c32c5800 x18: ffffffffffffffff
    x17: 000000040044ffff x16: 00000034b5503510 x15: ffff800103a8b617
    x14: 0000000000000000 x13: ffff8000818c66e0 x12: 00000000000007fe
    x11: 00000000000002aa x10: ffff80008191e6e0 x9 : ffff8000818c66e0
    x8 : 00000000ffffefff x7 : ffff80008191e6e0 x6 : 0000000000000000
    x5 : ffff0006ff69a408 x4 : 0000000000000000 x3 : 0000000000000027
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004ca7e1a40
    Call trace:
     clk_core_disable+0xd0/0xd8 (P)
     clk_disable+0x2c/0x44
     rsnd_adg_clk_control+0x80/0xf4
     rsnd_suspend+0x14/0x20
     dpm_run_callback+0x4c/0x14c
     device_suspend+0x11c/0x4dc
     dpm_suspend+0xdc/0x214
     dpm_suspend_start+0x48/0x60
     suspend_devices_and_enter+0x124/0x574
     pm_suspend+0x1ac/0x274
     state_store+0x88/0x124
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x48/0x6c
     kernfs_fop_write_iter+0x118/0x1a8
     vfs_write+0x280/0x37c
    [...]
    irq event stamp: 0
    hardirqs last  enabled at (0): [<0000000000000000>] 0x0
    hardirqs last disabled at (0): [<ffff800080097c44>]
copy_process+0x638/0x18f4
    softirqs last  enabled at (0): [<ffff800080097c44>]
copy_process+0x638/0x18f4
    softirqs last disabled at (0): [<0000000000000000>] 0x0
    ---[ end trace 0000000000000000 ]---
    ------------[ cut here ]------------
    clk_multiplier already unprepared
    WARNING: CPU: 0 PID: 1084 at drivers/clk/clk.c:1053
clk_core_unprepare+0x110/0x130
    sd 0:0:0:0: [sda] Synchronizing SCSI cache
    CPU: 0 UID: 0 PID: 1084 Comm: s2idle Tainted: G        W
6.13.0-rc3-arm64-renesas-01336-g13a53d27900d #2738
    Tainted: [W]=WARN
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : clk_core_unprepare+0x110/0x130
    lr : clk_core_unprepare+0x110/0x130
    sp : ffff800083a8ba00
    x29: ffff800083a8ba00 x28: ffff0004ca7e1a40 x27: ffff800081a0a968
    x26: ffff8000825ee000 x25: ffff800081ae0090 x24: 0000000000000000
    x23: ffff0004c0d64500 x22: 0000000000000000 x21: ffff0004c0d64480
    x20: 0000000000000001 x19: ffff0004c32c5800 x18: ffffffffffffffff
    x17: 000000040044ffff x16: 00000034b5503510 x15: 000000000000027a
    x14: 0000000000000000 x13: 000000000000b817 x12: 0000000000000000
    x11: 0000000000000001 x10: 0000000000001410 x9 : ffff800083a8b870
    x8 : ffff800083a8b798 x7 : ffff800083a8b850 x6 : ffff800083a8b7f0
    x5 : ffff800083a8b7d8 x4 : ffff800083a8c000 x3 : 0000000000000000
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004ca7e1a40
    Call trace:
     clk_core_unprepare+0x110/0x130 (P)
     clk_unprepare+0x28/0x3c
     rsnd_adg_clk_control+0x88/0xf4
     rsnd_suspend+0x14/0x20
     dpm_run_callback+0x4c/0x14c
     device_suspend+0x11c/0x4dc
     dpm_suspend+0xdc/0x214
     dpm_suspend_start+0x48/0x60
     suspend_devices_and_enter+0x124/0x574
     pm_suspend+0x1ac/0x274
     state_store+0x88/0x124
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x48/0x6c
     kernfs_fop_write_iter+0x118/0x1a8
     vfs_write+0x280/0x37c
    [...]
    irq event stamp: 0
    hardirqs last  enabled at (0): [<0000000000000000>] 0x0
    hardirqs last disabled at (0): [<ffff800080097c44>]
copy_process+0x638/0x18f4
    softirqs last  enabled at (0): [<ffff800080097c44>]
copy_process+0x638/0x18f4
    softirqs last disabled at (0): [<0000000000000000>] 0x0
    ---[ end trace 0000000000000000 ]---

Unfortunately I cannot reproduce it at will.
The above is from today's renesas-devel release, but my logs indicate
it happens every few months since at least v6.1.
So far I have seen it on all Salvator-X(S) variants, but not on any other
SoCs or boards.

Do you have a clue?
Thanks!

[1] echo freeze > /sys/power/state

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

