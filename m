Return-Path: <linux-renesas-soc+bounces-33223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCv3FTQVF2px3wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:00:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD05E75B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04973301BC2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42E936728C;
	Wed, 27 May 2026 15:51:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155B37BE70
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897094; cv=none; b=CBJlbS1tOxj+PI+B0HzIXykBYzC4jRQCdGVS7eSgP75JUxXhrMBaggFLdEH3ngjuim8zfs80HveGh4g2PDSkgMggldt4nmaTts33H127nvspK46F8YTtDOX3pP1PgIGNCWMM11QqJ4ud4U3W+PA+AL6In8dinn5tiknjEXUGDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897094; c=relaxed/simple;
	bh=qKbkZMJtkt73q6MVdq9NtMxASPvqyv84AwgiiThd+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rptdSS/X4GmyibfHrBzt0clbnfk2zMTM8FWur3Yn8O294QuB5ruNeLxu4/gDb42R5Piwi1QDBlqhEpBo/Fwe6CgsHzckKF8sYWcV7IyZinv9FZ/kjfBM34DwWaCCQO9k3eurBEmEf32Z24iFEY9Fndo0Xr8j3+1qh0BmuxCXRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-575320e6f2aso9559138e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897092; x=1780501892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bh+b2FSQ4S9tWiMljtZE1x8DvPABI/MvIYcGMABymU=;
        b=XE+Fque32yrDXYIfGwyjmyA0E+WPzuVq4s5G9BoHze5PqlAm1c0+UT7KhlbC0/aPr4
         IQhJgmWJNaL4YDD2acB4NgLS/PP/7GXk1cXiX/0OfMqAcelHA6myr33Nb9ov0zvZ/GKo
         vBmq9YPP4aPFQBudlKEg8xD1U9v//FjVqiKo4f1KNU4KETGPB+UefQCB0Sg2p1TjEWRY
         AjJYCKjvz1ksNgT66xJ76jHt0z2D/fH7fG0HmHL6RnAcq0MMiaVhAFE4QTujvb6qTIjP
         o063VfDYxc90usdcAca3zEcoZg8w/i5otWFt2w5IRrClML+aquZ3mZg3vdZw/gQuXZZF
         OC2Q==
X-Forwarded-Encrypted: i=1; AFNElJ96cTT6V5cSqOeLZuksBRzocQTvFBXDObl9NnUrtaJFqZg5nlNpi4qi5X4QLEQJeVG6iqcmyeRbbEe2fone5TF5eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywacc3f3TMLQ6OAFA39ZecMS5sdzU7s5ztR/U4eYLSnKOGLJ7e9
	sX7K7mrLeRRqGSOX3GZdUXcpdH1k9LfLXh6l/BhnYAD8cpVQVVdsDaHQ+mX71ZBX84o=
X-Gm-Gg: Acq92OGLGZHxtu6YF0nZPHUOaI1F5Li+iW0dYfh4I036TVDVqMHuCzS3Xvph3PjopOs
	8zyzF59FsgS9mypzUFYXsy/fokQ/Hqk8F/3EuZTi6qJeY0QajTjGom+BThLhfDF/TyNh9QLMSGA
	GgF1Ntot9rCGL9vcgL4t82TbDPYRULFa71fwb9xjutOrwD9C4detcFvPlcPtlw4kCJmFdQlnzCi
	d/x69X+J4Ydri/qH3yQpSeLFWeDbIo4NmFQ9NnV3iPsfcDi6IC71zh9gClfjNIWjpAwKJh9W7ZM
	UsRVnBTQC15K5CRyzlWOoQ0A/OO2GBRRjcTcw8VDMnGYLN2aWjO1L9ZEBQshW8DLkEdOiiLCn8v
	3wHvz9fQeZsbT4v//GDJiWt9ySGQ4mPrEV7dNEC3CWAypO9vWw2V8OrWaI40wHF4pDta8JWBSDY
	MpZnbuJJDjbXFen4sAu2EMGa98FrpTy3+gks18nBjNA6GMwYJj3zUaaBqg1gzl9ET3lYYrK9C6+
	B21jSxu+A==
X-Received: by 2002:a05:6122:1310:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-58664ddc313mr12605630e0c.14.1779897092418;
        Wed, 27 May 2026 08:51:32 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586ec46c8ddsm21345979e0c.0.2026.05.27.08.51.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:51:31 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6312970d9e3so8983288137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Iz8zcORvI2DL7IDrhax5YhFF3C7JgVRzUC7PUHXZ6tH1sdwb86YF6vOl5Wnj+cqFtxrFFgLxCo/YRgzRbHpEeyA==@vger.kernel.org
X-Received: by 2002:a05:6102:1494:b0:633:34c6:6ace with SMTP id
 ada2fe7eead31-67c8293fb73mr13015180137.26.1779897091174; Wed, 27 May 2026
 08:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com> <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:51:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
X-Gm-Features: AVHnY4JpYSaPlViJEZLn2urWPttxXKooTYEBn-cJQAbGcaWZK9sJWm1CqYq_4bU
Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33223-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AEDD05E75B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 at 17:43, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

