Return-Path: <linux-renesas-soc+bounces-33016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLI2MD5lEGoKXAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:16:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C75B5FC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06AFC302FA81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D182264A8;
	Fri, 22 May 2026 13:55:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B264400E0D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458123; cv=none; b=Vl7wKLdXdNeipLkzWxKr0OzApKOyyLgXfjX+E4h6PBi8CYPr3/jGVxKi1PDzY6HcniiHkYImA9uvt3Nj1iC0QQfdwptHjIL1dZGROexSGP4xzctrpXT73m3hiBZkfEIVG89M+KsR+RGgweYOlatBT+2qYUmyOoUg3qnv6W7K1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458123; c=relaxed/simple;
	bh=p6FsAScfvmI00LgYGoLuomprcquQsIoplyeLI0inSTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7cPabxN+5RyMap2jj86i+X0lqZmZIHALa48B4rS8K24pJtja9Kg60mLUjfj3fpgv3IpIt60EkGCemxd6XoFsoCqlkqImpLiU9Bk4j1k3+JdwULS8jahvsp8uM7KKn2jtdPobCLtu/pBB/av5V3Pn4Fghb/PsdRfZQMh0LU9vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-961556c15ceso927939241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458120; x=1780062920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j30cmgYlFN4mDEmlnYqRmgElSbQTzkiiS0OsZr3i+6I=;
        b=TNsQOTJXHkF1uXBId6Zk5u3KfIZ51zRIT6viDIrulNG8GaADfzK4lzLsgIcTWKibMG
         Q74QtQvPFlUhe27ssSMkuR/zlqTDPsta3mSurVrvDiwmnrAvCxi8GvXaXyejACNsHcqP
         4kdls4jqr2xw446rIFgKmFl31Ixlk9kzfMIA223U4zxDzoLxG+YBzSABz2KZjtnQiSda
         L9/fgm5Wa3V9lQVD44XVuA0MIBe/t/0FSp1TeACBy6TCjmJApRxlVFTG7FiqXidiIQuI
         gRTtylGHjrxfo0GzMgUwOBXxkMl6yEIvOCGIgtOlDonDbzcDrQY1cHxNT10QYvVpIwte
         3rUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QXKCLDE51y6o6WM0VJp0eLj5oVPxI456oSC2AilN9GyvZ2ueM7HbZANu7tSKRoKREXpavaGaKsTSeyOCtzIG4tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWduuJU1hAmzYHHMvFB9ATC9XGl/yCocRFZjdGljnXZ5dtvNmG
	mIBKEVhHkm+Ay770JCJPX2MIRo5L4Zy9yC2Cw+7ZoTbQFRPDXP4Ha78B5VQMTa5/+DQ=
X-Gm-Gg: Acq92OF3BmfWkNopWtHF1trTw8uDOIguaqL3v7II2kQ3uoeESUwsufiQ2YlT9nefRAO
	jRbvF8uAKT3PSLIKI58/tx5uGQZGNxgURPftsTXclvCdxqnmEBOcU8FM1xLTPANV06iuWpAhivS
	3Nsv7k5NZBwAtBF9J43z1n+/FWNokNLzGReDrpZKlnU44CXqXx5FZO3X0msVqu+3mEdtMIkzP1E
	4ATSghb8/chPxu/a42DSvJk32P5CU0Rcj3r19ENFl7PY38we31xDquEoon16dkM7jjKLuGXHSSS
	sRhRL/ygIcZ6G6iXrO2aQxZ9fC1RTvh/WS6dKsq2Csy6XrJNn1yBlPeJaqhF1fIDwzhHrySdeQx
	IX2vQ8mcuMJb24o/1ZthcaLh3QC5u+bUiTH/WilTUniPQTk1xPqfnODax6T3fPfSYyVs0xxmm5g
	ZTYOIQtc53kI0aTxYx/t6xF5M4ps3UIBo1baHJKrr1mZuD312G+lTfY/poedOsZokwZS3jFvk=
X-Received: by 2002:a05:6102:5e88:b0:633:a4bd:5b28 with SMTP id ada2fe7eead31-67c879ff5a4mr1601946137.30.1779458120069;
        Fri, 22 May 2026 06:55:20 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bc134sm1632640241.1.2026.05.22.06.55.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:55:19 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-63329e1c77aso2282399137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95Lmb/8T3U6Ui+sWUYlThIQjsV5vrwTorNJsLT1+6BhM5/mtc5ABzMjsjERfPPxxWD+s16QZ7BQ1qDBCuDPOaanw==@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:608:94e4:1c00 with SMTP id
 ada2fe7eead31-67c7490526cmr1691949137.2.1779458118939; Fri, 22 May 2026
 06:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
X-Gm-Features: AVHnY4LbuOPf1FKjHR7ZFR3fWcySVRSaw7vpgkocdsWUrZ7gBa__02wKZRL9zBo
Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r9a09g077: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33016-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 251C75B5FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

