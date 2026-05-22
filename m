Return-Path: <linux-renesas-soc+bounces-33009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CPtMr9gEGphWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:57:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBB5B5AC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA04B30623C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5593C5DA1;
	Fri, 22 May 2026 13:33:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA183C3457
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456821; cv=none; b=fV7AUxoegrqv1Eeqg6KPg2zB7HWDo36vrO43HYluuDQVMelRdLGTlTkRMicKJ/GM9rUfieLTiO086zkxPEbBHY/933oL6l1vSejhopmLKYCMuZPrWX+3/WGDzxnWDO2JYKaphkU+YyRvlXCrHPaG1YOOodPsX3Qdm58lFOiBjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456821; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCNYfLxcmzG76/rrHZHCPyJB7U9GFfH3uSJ8gxnCzHFIu+Nu+szmPA2DkzwcGT7nb1dSVhmhf7UmMax581qT1sG6OkM8T2sgi63Aicsk3DG7EDUUMQXQXOSLIhr8YQ0i8bkJcce1tJmZBuj/vZ3mEVdC4idRnxUhqa3muUpNyNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-67bfd0ec7f0so986001137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456820; x=1780061620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=fFgl9BVKtttBLtGNK/qvlkuC4dW67XqD8WqLFX8TzA0CgNHpr3dAYE2Wi4KaR49MSD
         J2Og+7wlbOJ9oGGgvRi5bHV2gCG/4qE6HjEv04f85WfpUMyaoT124c1mQkVucaxg/r3I
         Mx5Fyx6QSkXO40WZqfE3DS1i4k7402/f1JdZ0PnQAeEjhbtvpR6/TYewfYTvvOTrQJQA
         eEyWsbZX0yNrzQM5hOnIFL56BbFAES1dhDcfOlkKlfQ6Snw+mvY/yvPEaaMEqBUHPREx
         8mopTSQd7mVg5NKXA/CdalfQmrzkC+2toREOWcO9b095jSKp/fFnbkJwgSb1sULObHXp
         5xaA==
X-Forwarded-Encrypted: i=1; AFNElJ+FVviOfAMBvcixfFCaJNLIZoVACQzFBcTyyQ3uKLmebxrjrehqSW/iD7j43vwj14zO7PDzOFncEq7tsAr+1cjX5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1MFpWubmQesYe/TXkzq0YLQEF9WkB0Qxuq7ITbwNURzVhn6PC
	2cGcZ33aux+YRdE6xte9MZnhbkE766JC5il5rgFGTeNcW/ENzPKltWgduKAtHoVEHFQ=
X-Gm-Gg: Acq92OGdm4FrmnPVTKxe6DmMSH4Iw1poDdp0ZxM09WNkCfzlY9BKYCiaAnjOTmpt6ql
	EMCIuSaSoNeezQFyGeSX98svuOHTxwQyCNn/60AymV9pZfCYYun1nUqnJYHFddBW0mmDDPA05AF
	SpEOr2hOUf1TexbiSYIx8ynpOO7j1b1QTikorcVeWa2sN4LbQYjWgd5CbcFp47Z0YmxXlqrUVoC
	08zaezXxVOA/e4NbnKP9+oQQg4DdYMFwTiVi/zPdChYLJgFGIUakOfX8r5GiNpL1PcTOM+O8/SQ
	PzhdRZtEaVJs8d0DPdQpO41cZmT5BTBpsWf3ZL7fyr8QYA59EGezRQ5nfYn/OP5bl6xJYKqyZlu
	VaqljRHjQ7wHMZhY73YXH79aH5EUknHkU3b1ufSwixvr+4qobJjh0SeVOC/XNeq6kvS4OxezNky
	d5XrB28VoE9LZMybI1l675RKCjXORlc/2iRqNcWPzZfPJaDDaoDWFyBPUqyUHZ0J8qFCW8lJg=
X-Received: by 2002:a05:6102:b07:b0:62f:3abe:907f with SMTP id ada2fe7eead31-67c7cee41cemr1907899137.4.1779456819656;
        Fri, 22 May 2026 06:33:39 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8851f5bsm1315946137.3.2026.05.22.06.33.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:39 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so5832930241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Ptt6GDfNaDUjmilShCtPUmqTcg0BpdTiWdjKVzk0g3ihZHx70ZA6hS374VwacNpEFH+oQbWqCy1jYxr6H7BXI1A==@vger.kernel.org
X-Received: by 2002:a05:6122:6608:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-5865fbfd0f5mr1949935e0c.5.1779456813889; Fri, 22 May 2026
 06:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
X-Gm-Features: AVHnY4JZvFlBRVi5_begA8jgTeOsJbMlX8gu1et_uqRuljs-iJ43iZMHA347xug
Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33009-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 85FBB5B5AC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

