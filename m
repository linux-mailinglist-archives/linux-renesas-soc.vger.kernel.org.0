Return-Path: <linux-renesas-soc+bounces-28703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JnjIBrgpmkPYQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:20:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBC1F0181
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4EC43134973
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E445E423A7A;
	Tue,  3 Mar 2026 13:14:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36DB340DB9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543674; cv=none; b=tg60JarvDhtDeyEWLt0gYv+COiouGz+BAw2tLndN4CHThgyqcgrd2CahUjt8GNJ9EWdOVTuavijkTGdOI+zqCU1qjY0eQeiReg5Htg3IZgK4JopF4rYvR38YtIh2yNYQHfKLpPgXpXW2ywzUA9Oe7pL5w90+Dd0ihwcYrxMp1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543674; c=relaxed/simple;
	bh=gcVKBhiWEywu8IVtdOHISgtMYk/liHzhW9EmtjMMR6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVhK0qDbvf3xJ2IBupcLBUjYdTX1bc2BTWd1dzJzBPXHSyXct1v7OnyhvCCrKmyN77ak9aH4vnhXcGssZ9JgDVksv9Ea8SX2sIX18z1FiRXLAV9mYjzj/1nIHru7s2PkJWAClRm6QV3FnoKDPAsx836Q54YXaTFgIGoGDZML2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso3537032241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543673; x=1773148473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7piWhiIWgPegFcPXnZxv+AF8LrC/qNugfBvwGvY2QQ=;
        b=A2f9PaonzD2ye32Lf2XU/DbSOt1mJTRsKACjIlzB8EgOBsCWqNhS35Uk7jvykbxRe2
         n0S43SJCBcTsRmNrvd3TzFSi6imr2Wa65fvAeYlLHjFjRQoNKvXlwiLIzrpb1NgI88ID
         Ev/wFJytnqi/VVz5bkbRUVhIRPI0WINu7dIV+cF3moZrYoLHP6Zbb06IcdoNrz4mPekA
         kN66q1PKw6c4/0hSGmDBd3IH/Bk9LYjgBDleSIqA9nLXO4EfavI+M17w3kAx5Wh6vyR9
         0r1y1jZh93MMgpLNzKi8MOVBOUBPGszSRC3WUwcxEaxPXSZpnc7sxFZrC10N2KUUSANM
         QzqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7YLAlslEmAsUShsrgeRl25zgiZJ/PQse4XOt/25mEDQlDQl6Pp54cI7JOzRiPUj+8SZ+dnAsFLCDg3Y/AIaDUMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjjUlnRm/+1EeGSqK8Gnk0HHiId9YVC+D4Ndxf41eRiCrCURc
	EM+HrUy284B8CaxGiraYmXxCg0oih/XLOn0giJqtKnpPvEqR9tWcHFJxYrdtXmQ3
X-Gm-Gg: ATEYQzziwVUrKxEB5zgkjNdYAIXcvK571xOt4mkc/nZuhEQiIbNF148EXOViXFfxjq+
	iIYX+D8dsv5iBbGDIS5lnPJyKKbiBuaGOfPir7VUgggE2+VYy4MPM4XTXoUSvkPQvIH2cd7NJ25
	7cME9wbLVfvzBwnoSpZkUXz0Sm3gHvQ33wB+/s/v/T4TfxvF2z9imzV7etK9ZUW1eWbdba9pOmt
	WyBaX0wp202JcsTltSGstp0N3eQCXNFjQY5XkT873c++vuzcdoalFiuvN86Lbt6NkjPp7hl04R2
	V3qlbQ7ZqrAcOx1HJSHXJzxlQg8xNc+ZjhpssI33GTnQms3xSwYM7O5hNlAHwvYatXP7rBzVqy1
	pWdNPXQ+lzaMj3aIJ3BJGQXaU0G+rreAcHu/zmglC+TkaJFImQhU0RUiIKk/OVn4W3mqZjf3Gvk
	lMJCQQBGHnnUhznXW+hOxq1wSi6mXVWADxRiQQumsJVEN/o6TSruGFiPbPxAJIfp5h
X-Received: by 2002:a05:6102:c86:b0:5ed:d33:a65d with SMTP id ada2fe7eead31-5ff32564152mr9288517137.34.1772543672713;
        Tue, 03 Mar 2026 05:14:32 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d8abbsm14636207241.2.2026.03.03.05.14.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:14:31 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9402b52fso4828971e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:14:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVWnEP4Fc6x6PsWW1+BCYAJa70QPUygTU8oeHwFvEGxFE38b/AFiIGLtPc9mZ0FXs97Bl9WsJBOsl3Ki++8FQ7nA==@vger.kernel.org
X-Received: by 2002:a05:6102:32d1:b0:5ef:a59e:617a with SMTP id
 ada2fe7eead31-5ff324e88d4mr7987495137.21.1772543670903; Tue, 03 Mar 2026
 05:14:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260123225957.1007089-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260123225957.1007089-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:14:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKVXyyT-kB9BdZsgY1cUeXepcA3ZSc5k-yv8-dB9Unzg@mail.gmail.com>
X-Gm-Features: AaiRm51CxZV-LXYs7xMcfTPengr0S-ob571jJ20tJGIKLTg8dNkzKwHWgTDa6o4
Message-ID: <CAMuHMdUKVXyyT-kB9BdZsgY1cUeXepcA3ZSc5k-yv8-dB9Unzg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay
 for SD0 regulator
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E1CBC1F0181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28703-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.536];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 at 00:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Set an appropriate ramp delay for the SD0 I/O voltage regulator in the
> CN15 SD overlay to make UHS-I voltage switching reliable during card
> initialization.
>
> This issue was observed on the RZ/V2H EVK, while the same UHS-I cards
> worked on the RZ/V2N EVK without problems. Adding the ramp delay makes
> the behavior consistent and avoids SD init timeouts.
>
> Before this change SD0 could fail with:
> [    2.646242] mmc0: error -110 whilst initialising SD card
>
> With the delay in place UHS-I cards enumerate correctly:
> [    2.633493] mmc0: new UHS-I speed SDR104 SDXC card at address aaaa
> [    2.641687] mmcblk0: mmc0:aaaa SR64G 59.5 GiB
> [    2.651489]  mmcblk0: p1
>
> Fixes: 3d6c2bc7629c8("arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

