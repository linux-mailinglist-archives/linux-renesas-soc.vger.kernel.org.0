Return-Path: <linux-renesas-soc+bounces-33191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DsuALWgFmqBnwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:43:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2645E094D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7BD93005D15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 07:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61833C942C;
	Wed, 27 May 2026 07:43:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB63BD24A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867787; cv=none; b=Im7WipGpg0pZJLY/iUuaQd6bUcSicCJIIGMulk1ZEtbvjj7ZTzFjXn7cDAZYDdGaA5ztfemuiclZ4RBbjsmC6zEghnQJt3LoCHzpNQvvW8B+i4VDckpo7wikKrSovOJ41GzsXeI+xdjtHZ6vGehoiuWCT4IbgjS9YAG0Zk90b04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867787; c=relaxed/simple;
	bh=JwgSYIJee9nbOlXvju6QWKDMz2Smf422DMhM+XMAwDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgAnWUTNLh6o+7yCCDQK0ycexo/q3oeG3EpoGCvirsvgc01ywbEcL/tawVoRcWEtLFmCQMELYSAChUW84+HTzJMp8Au8wFe7OoOAYiRW1p7p91MgsFUgKOfCEM/ftaf9/B6Qo4l2jjFXrR2VrdaWm5CXYJVKzPEwO2Pz2fKF4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6312a0d556cso5357067137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779867785; x=1780472585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaz04lQzyGk1Skxwlpp5bPiKiAek9aybHx2v/yLROzU=;
        b=dvKcadknhIum7xSXCaFJGgzA/IzVUy5EkyypEQQrN4Ks8j5eI32j6NfONBIMlHv/39
         HWopJlUjEs7Q0GM+xpZYMRXxNVvHUBaN5PKeneR9HxwfZ/PKNWMhUTTrj/gC7Z8WmgzH
         iMu2LXncwrzF6gvWCP6GgCE/GqTPNcwPmXbTAgBbJEMJiEBdfLDFWK2pvvI4Hzem0vcJ
         uCbdq6tm2q5S9pYmhf2dxAoEdfG62KvvwZsWL3A93Bm4V5nLptMeKu0pL238FYUGwcrp
         2NJ2NPM5SkEv3/AOZAUKwEBTtLe2VXSTGp6IO7JdnHaEDbuMfMiajJ4i9oP7l7SEaxdL
         S3Og==
X-Gm-Message-State: AOJu0Yzu1ZEjeApXpWVzr5LpegIFS5GjIfr6W5D0FlporTQxl1OVtpv0
	MfkO+P5a1Rhmd0vkZecHH1mh23LKaow+e+gYkpdLjXp30wdUXeujewhE+gvtXRMgCrQ=
X-Gm-Gg: Acq92OEJNSvkvfaq5PvHmSJPHN8+pIlN0IZUP03FtUoNFOEf0puNnjWCwMXbSP3f+++
	FPJDCK2OkTPAWOvNP+gPOTfdyRneInej89BldsqXEaWEluHbOLADi2n8LuBhg0oSvTcm78S12vK
	/Mbo/IHzM3BWo5KaRT/eKZaPTsukOymd5FZtOZfV5cSR5mehIRBxFF6ThUr1NWbY3/aI4H3vn52
	52SWHR+S8z90UU+QkDt326F9K02eTwGxF6lMcDZly7Mh2CJY8f979hiFjCwC0gRLB0x6rl7nxxr
	u+wQ6y0wic9gm2A3e+HRv90QtT+Q9nA6UCUhMb4V06Z7uw0r4Vnd0vBf1weOFxAzxOKVqMb7Xtd
	8frjKoaDSSB9z2qs9KGp0Jwt73Od6zvSKBCeshYDROOO+iXaWxr+o+KWR4dzmEUiNAFRZA6RAyr
	CbxswcGsYrrQTq3j0GAgMDTTgo4EOW8aipCwLvOYsLNn/yRtf2Vpt6hndJAYYcIgKSUqdL2xA=
X-Received: by 2002:a05:6102:3e28:b0:62d:b0b2:88b1 with SMTP id ada2fe7eead31-67c7405ef67mr11664467137.4.1779867785300;
        Wed, 27 May 2026 00:43:05 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8851f5bsm15884553137.3.2026.05.27.00.43.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:43:05 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so2751597241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:43:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:607:798d:8083 with SMTP id
 ada2fe7eead31-67c7ffeba62mr10523147137.15.1779867784961; Wed, 27 May 2026
 00:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com> <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:42:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOgpsakC_C_uUhPttfvK44j8aRuAQxG-BWWdDdioQfzA@mail.gmail.com>
X-Gm-Features: AVHnY4Iup01oc5_MZvrm0JVzZZt-FPjPltbZPQJVVUpHhN-Mvj_g0SQttnrdTgM
Message-ID: <CAMuHMdWOgpsakC_C_uUhPttfvK44j8aRuAQxG-BWWdDdioQfzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: renesas: r8a78000: add MFIS, MFIS SCP and
 transport nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Hai Pham <hai.pham.ud@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,renesas.com,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33191-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 6D2645E094D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 09:47, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Describe the MFIS and MFIS SCP instances which are used for various
> tasks including inter-processor communication. Remove the PRR node
> because it is part of MFIS on R-Car X5H and should be handled using the
> MFIS compatible. Also, describe the STCM transport area used for shared

S-TCM

> memory mailboxing.
>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

