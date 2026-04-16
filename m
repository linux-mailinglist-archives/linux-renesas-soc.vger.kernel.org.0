Return-Path: <linux-renesas-soc+bounces-31326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGwHMdfX4GlymgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:36:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782240E4D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA8C4307F9E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 12:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414033B8920;
	Thu, 16 Apr 2026 12:33:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A13A6B79
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342793; cv=none; b=c5TuEcvH3uVJYtpEdexab5/ECqfKugPpEzjnkiVME4HcuwT7hsN5QS2+HR3owmL4BqOnVH1kcm54am9mOEm2Nsdn4mIr5R8V3Wmqpi954KyHLBjokbI+vy82rk57L4TGsA3N89QsOhlOhOA6NFjD7ZkraXaRZD6u+VE4cWZIjow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342793; c=relaxed/simple;
	bh=F0KRr1fNLI9QNaiGUy7X498/hzWHeh7SvOfYmIbsG+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzwVKmM8wbvlpq0d2jNcHWEIPbqMIKw04QpltIvSG9mTVUgEZGPAvFcueBK8W7J7EOoqeUpaUxq42oynjp/qurpZzVEy2lrg9LMzWm2EzCxo95DOCwnLkB9YGjII+loyOISPe8WBCWsC262TuzCMLFffTFq4MQrGwmN5U5N5OIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6055a0414d7so2289902137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342791; x=1776947591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRFemq5MfyXGBsug9FBiLn47cAaLasQlDTsqCZS8paQ=;
        b=h4uvP7aCXhPO0nnaIvSXcsP2S1DeXPOx7TlFUZ4cE8HHpQN3d3RH0gHyHzbWnAiPIH
         x9ZxXmb5oIftpQ1GeXHku9t5/nCY2g71ly1tfbp1nMAJFzMDPcuF5ekeysl3tFotIXVv
         Fcs/hRBxAGOKT1SNh0m5nIAlhmbJ1TjqNAWy9cCbA2weBksVGvoPK170rh7P+Th7U7PO
         Zk6d2qaxRxERieLSYAJU7qOuqKHItzcFuJX8FTRTzxUhAaPqB1CYuhfyY9UhcdBjPX+M
         9QCjV+YYWcR7za5Os/2pCqDmFN+Zirtvubg59CKiYP2QpkGRdpVL330KUnhsuwMBkvWf
         V2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/bT35iIGAOeg/jNeGgRpo+PSJ/vxLGc2rk1MH2Ii8BsmEHMAcf2jr3xqQ0VwC7Pa0X8Ab7hM0LFXNn31wjIQ5gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UwwVIcs+xcS4G45HcuCOb1WdaRpTFRoAEPz3iA4WOYfGukYQ
	dkOG4ZkPPZq8lHIEL6Z/EduTDpslEGHmZIBW3uIUxKw7MftrZjlbxQJDU4ShQ6tS
X-Gm-Gg: AeBDiev20dlGayjIjcJLedMlhav3Lb+kBRf6URs4lbTQIlx2kl+IE/XDA0aUKFyVGON
	oLIq0eYqPbsOHadoxVdtK7HRA4Pxp5NptD3Aj2OjxfbpsW2ZuqDH0FGsUPFR16etFSb1rKPQbyH
	5duXun1a3zqU4dUo+nhOv3BTls/Z4MjuCOmBXrIMUS706/Ki2wZTX0U4g5G/hET5/s6sqIrPbnw
	XdEZEAnsf/IGkujquT1TbADhLoJ9KnJF6ndmUUmB8Sq3AZZ2kYYntoWEdXy5mRGtCzez5XdLfqL
	tkUlsGZ5C0KISwMh3yMUnW+My/MjZ8r6uSVw4ChZrRfH/3jPe2aNF2Tzgy6e2sSyjnTTTGuY6jh
	l0Bojgr2sycsbai7mSrdr1W2Igc47NaOXuT/TTbD/g53OZZpESmO8WurT5S+s2QHfgnV1AR/Px9
	ka3itOS/WPBRZ2bYdwX82hHUncQ/A7eLwgFfJ0jHetGYFZWF6pPZadOu95y7qlUsiDOw0d434=
X-Received: by 2002:a05:6102:2ad1:b0:605:b96a:a0d4 with SMTP id ada2fe7eead31-60a0167fd81mr10391809137.27.1776342790755;
        Thu, 16 Apr 2026 05:33:10 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958656c5706sm2129392241.9.2026.04.16.05.33.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:33:09 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-60fecdd1efaso1404406137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+QYU+oZa1+21U6ghshPzcdW6lt6ucNVScvFKt/j0KPyxIw+SOkg7qN4LeDvOYSIoOn3zELGqlg8amQKmPqmBodqw==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:608:8fb9:9102 with SMTP id
 ada2fe7eead31-609fb6720ccmr10437630137.0.1776342789380; Thu, 16 Apr 2026
 05:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
In-Reply-To: <20260413100700.30995-7-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:32:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
X-Gm-Features: AQROBzBguP3PgGaZjGZ5LvVBGYPHFMcYN5pNT3cJNtzjVS5xLJ_ABy0llU6KPj4
Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31326-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4782240E4D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bui,

On Mon, 13 Apr 2026 at 12:07, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support a flexible positional clock list to properly
> describe the hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for the update!

> Changes in v2:
>  - Rename FSI module clock to "own" to match driver.

Where does this match the driver?
Usually the functional clock is called "fck".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

