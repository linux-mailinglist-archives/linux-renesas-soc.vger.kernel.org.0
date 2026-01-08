Return-Path: <linux-renesas-soc+bounces-26393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D5D046C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FAB93215A4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7F23BF310;
	Thu,  8 Jan 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mhVbFqOo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBD38E5EF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863584; cv=none; b=LrbeKAkVDeLv2Znjj4wUCBwj+0+RbRdUFWDhg+NeePmijbM2h9hRQx8QEKUVKooqaLXELcf7zXLUt/dS6Kx+H61A4LL2y80JbJf8UmcK868E+ZoiUv5bI/YvrP3OF9xM6IhM3QYtlPnlIXVcDSDJ+nbLBp36EyHPt0wllDFCBWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863584; c=relaxed/simple;
	bh=/B5yiqA+ekMUmtc6Bq+Hgdkj26PJlhDLIdx4NpvlZcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4Ayo9kNBa8gl42h/lxxx43iFDrj7dJ+iw41fssN6e9kajN33YYgrZu+nXFcCxo1NEQXNrsN7nty/38TvHpyh22wIQxnbgesZcvPL9FZACtwDBfFOrdq2oEW26lMg5LNbpn/5OcPg0sDoqW9p4/u0/lSJhGHPo6fiQRbTtiBNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mhVbFqOo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so19584335e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767863576; x=1768468376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcvzzJMrh0MsjpTIZP7Mzs3g/YqR5+Qi1rSgpNg9db0=;
        b=mhVbFqOopEU9ULbv80Yr8Yt9hyJx8n0T2RG49I6JZZy7GUCZ3asmt1tx6l5OLgqPlJ
         /sjBXJfN4O1sXP5kMeCcbUfhnX7Ugr4EBKadfYOLk0EF3vQF3aLZU8Ck2ujzmDbudZ78
         yKCfhY1fAqTyNwOcp3IYKf6n0Z5y9Tym2FtqYL07EzhYJDSElHeEnCNFr7DbS8CJk2hP
         qQZZVoTbiTXcWEbbFcDur5Klo0tFFakhjpHud29Ckk6t9bViyiOCsoX7lvtKpQ1DrcYC
         iEZ69iAddlWPN+yrHBoLzbA/KioFHWnW8c3+1xhRqtiHl4wjcnzJuvuydgNdGePCIjkZ
         RktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863576; x=1768468376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcvzzJMrh0MsjpTIZP7Mzs3g/YqR5+Qi1rSgpNg9db0=;
        b=vvNWp2VPuLOiev606ObJzDdG7QboD08q0oaZkKIh10P9mYuzmTW7i6+3Bpkwga8405
         T6dGoIxAieRwZdnJB1Jfvm2zywinI7J2vYCX1QEz0oNhEsR776nv/4DkbPhNumZyp5HI
         JMln073mb5pssG0k8qXe6VgvSb7PQfnJSACI8PReaPuqCLCwer5UK5Cl6t6tyOj55NgN
         9Fu67M2e5zXlP7qRyydUmWOnS71RBVfq9r3CrZ6r8YJigjBC6xHfhKZSOkkAtEagyNHm
         qKyx2MyLGkxbiqTHyDhDPRqvTJ2gNsC2lsXh16h2aNPRxJwqguJcD61vUYGob244Nrzu
         xHXQ==
X-Gm-Message-State: AOJu0Yx1P5JVaLR53igZHacNS2bGdRvyk52oBjhM3ouQFeMkxMQy7Gr+
	U0HkvHGzPX98E6WrZPNv8pc6L7z7oORb8dCTFGNLuHaH1p9EDnaPlhoLXMC74KZwzo0=
X-Gm-Gg: AY/fxX5Acqh2LFiFKEJMJ17YZfQwANiNVqTT6Hc9FleRq+pZS+qCJk/OvvWZu1ExO4r
	WugrI0yz5d2xTc8qqqSeKWzyHBAOb0TZmYpZcsWwcdmS5F1I0ZDg0NlymmZ2vyTBKBF5giifv2y
	REUJ01bhLw5turuxjgjzB6rBadodE2xdir7TZjFOnNz3F+0u0ui5sTtKIYaz7BmsQ5RK3vFI6Lc
	yj7m8SiI93mCzQzlIH9d8dwZKBqfhVJ+BpKPPfq0qsyFlnihlXuNR1qKlMSuQQ3WsYavCNscCph
	Lc3k2yMaKOWrmSk5v8HGU6QhhR4z4S6Ixvk38UkbkF76qMzF6YlTiwUZmazxJs6vF2utjna17Gp
	+XFtqx/cvXvh3q7niq+/q19QkOM1GWew6Xx4CWwAf/gCnA8kmhPV2jaV9DJaAhb2L07VklGp/bE
	SrG2EM6Z3OCn0oi/3TTQ==
X-Google-Smtp-Source: AGHT+IEP9/Gf0jNEPP/nIaOJ3PVVTz+nOM75oWhn7OGPLdOsoh+kDwG2RY2j3+SjdUgMnPGB8cg9XA==
X-Received: by 2002:a05:600c:470c:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d84b3b4ccmr57983425e9.18.1767863576326;
        Thu, 08 Jan 2026 01:12:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm151578795e9.6.2026.01.08.01.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:12:55 -0800 (PST)
Message-ID: <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
Date: Thu, 8 Jan 2026 11:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
To: Hugo Villeneuve <hugo@hugovil.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Biju Das Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Hugo,

On 1/7/26 23:48, Hugo Villeneuve wrote:
> Hi,
> when issuing a reboot command, I encounter the following kernel panic:
> 
> [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 -- SError
> [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183504] Tainted: [M]=MACHINE_CHECK
> [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> [   36.183547] sp : ffff8000813db860
> [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: ffff000009dd7450
> [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: ffff800080e1f7a8
> [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: ffff000009dd7430
> [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 00000000ffffffff
> [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000813db220
> [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 00000000000009a2
> [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : ffff800081255bc0
> [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 0000000000000000
> [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 0000000000000028
> [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : ffff800081780000
> [   36.183652] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183665] Tainted: [M]=MACHINE_CHECK
> [   36.183668] Hardware name: devboard1 (DT)
> [   36.183672] Call trace:
> [   36.183675]  show_stack+0x18/0x24 (C)
> [   36.183692]  dump_stack_lvl+0x34/0x8c
> [   36.183702]  dump_stack+0x18/0x24
> [   36.183708]  vpanic+0x314/0x35c
> [   36.183716]  nmi_panic+0x0/0x64
> [   36.183722]  add_taint+0x0/0xbc
> [   36.183728]  arm64_serror_panic+0x70/0x80
> [   36.183735]  do_serror+0x28/0x68
> [   36.183742]  el1h_64_error_handler+0x34/0x50
> [   36.183751]  el1h_64_error+0x6c/0x70
> [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> [   36.183792]  ili9881c_unprepare+0x38/0x88
> [   36.183802]  drm_panel_unprepare+0xbc/0x108
> [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0x5f8
> [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> [   36.183865]  commit_tail+0xa4/0x18c
> [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> [   36.183884]  drm_atomic_commit+0x8c/0xcc
> [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> [   36.183920]  platform_shutdown+0x24/0x34
> [   36.183931]  device_shutdown+0x128/0x284
> [   36.183938]  kernel_restart+0x44/0xa4
> [   36.183950]  __do_sys_reboot+0x178/0x270
> [   36.183959]  __arm64_sys_reboot+0x24/0x30
> [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> [   36.183979]  do_el0_svc+0x40/0xc0
> [   36.183988]  el0_svc+0x3c/0x164
> [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> [   36.184002]  el0t_64_sync+0x198/0x19c
> [   36.184020] Kernel Offset: disabled
> [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> [   36.184028] Memory Limit: none
> [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> The problem is present since linux-6.18-rc1, but not in linux-6.17. I also confirm the bug is present in linux-6.19-rc4.
> 
> The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
> 
> After bisecting, here is the first bad commit:
> 
>      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
> 
> Reverting this change makes the bug disappear.
> 
> My limited understanding seems to indicate that the MIPI/DSI host may
> no longer be available/on when the panel tries to send MIPI/DSI
> commands in ili9881c_unprepare(), maybe because the MIPI/DSI clock has been stopped...
> 
> The exact same board with two other panels (jd9365da and st7703) doesn't have the bug.

Could you please provide the output of command:

cat /sys/kernel/debug/mstop

for both cases?

Also, could you please check if the following diff solves your problem:

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c 
b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5edd45424562..62957632a96f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1282,6 +1282,10 @@ static ssize_t 
rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
                 value |= SQCH0DSC0AR_FMT_SHORT;
         }

+       ret = pm_runtime_resume_and_get(dsi->dev);
+       if (ret)
+               return ret;
+
         rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);

         /*
@@ -1322,6 +1326,8 @@ static ssize_t rzg2l_mipi_dsi_host_transfer(struct 
mipi_dsi_host *host,
                         ret = packet.payload_length;
         }

+       pm_runtime_put(dsi->dev);
+
         return ret;
  }

Thank you,
Claudiu



