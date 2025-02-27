Return-Path: <linux-renesas-soc+bounces-13791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A36A48C80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 00:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E123188F0EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 23:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B297323D;
	Thu, 27 Feb 2025 23:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHPArRCv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE42309A3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 23:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698088; cv=none; b=RXyJDZBvEcE6qHBiHPHVSPHSgjXTTNs2K7s9M+PMDCeeNxSBNL+AVLfT9WHCkDcual5IVkaEBsOrwatgvs/5Po2bX6CbPWDSI6Odc4YzslEL36hccbLdrntaPXHYaG70GYGCV9DDvbe+8Wc28M+NlWR+9EAd6YWymVKIDCwCfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698088; c=relaxed/simple;
	bh=AnuRApjr8EMi+iloki6ORcjaT87Gp2iSLXaCOHdnddU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXeILkxV4fYlNNt44KhDlbqFH5MilEtkj92udT5NVcNhD5MYZQRsmSZsfcNpqtLz3JJkkIyzZEVfDxYQFXa2yvslN+2UjpZuj2p8RRSmy3E1EcJN7ECTdoZRmMnFTpmXmX3jLyy8vY+gwsOtfv3LoIApTJCUyqF1k7lVwslQ878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHPArRCv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5494bc4d741so533950e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 15:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698085; x=1741302885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkUpLsB+tWxeVtC8e1hLrjEnl5f+xvYNaekBrtnharA=;
        b=vHPArRCvoWnCjZC7BJoinlnnqZlv8mjwP+Z8qkW/Ti6O+ElXLL8MQjaW5v5Lpo50WO
         8jxqLHUklmXYVyvTSryVg8IaxNd1stv+m5PLYu+kL4aKyaOuUgIvFPdYmpAL+QmzKAgS
         ZkohwPFQF310bYKY6QTkW3gH/G/lmtHbLYQp1lBWAsL64DJv5VbCwWt445x8bCAOQJOo
         KyCaCdCZhcejFUmAoVKoLUFzvtw1tCpCVT/E5LaWxaUZuEKGe3OwP/j5MgY4z2EQNaQt
         /0KKGqiEQYS9Grj9yJnNXlVEO5IsRXVrVjfA3+d7OJjYkKKKVdVHDFgE01sev4By92q4
         1PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698085; x=1741302885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkUpLsB+tWxeVtC8e1hLrjEnl5f+xvYNaekBrtnharA=;
        b=L2ytLns9UKMuVjruEKGKZJi4GzRFtUXUxCjJAkARhfM25g23XL2ubuU3X/xQletBhi
         pnlb+ttdZUwf2LapyFTIgS6X9xd3zlMVyC0SPaAxv2FVPZRpDdPkDLkwj30/jDaYevZ4
         SiUtNW0/n4xdosK3e2pDIQJNDh7FzlIlqGE6H9Qm9BGLS2yWznGL63itCgMiPCQzUrgz
         Cr+AFzyPDPBOYefMMJxba6WrVaoczJJTVx67EWoNyw6ZyKaLANZ42qbQB8h89DZSUPBN
         FhyLvLZKndK6beQD1Wke46gnCoktE6o+iv16SA+X+Qg9/wG8m1Fh9fYcMO9f1G1kyiyb
         iGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0bd6QIPZQOEtVMJd01ma8Q6BBfJk0tFzN7G1oxvornUve9R2PbvlaBAlrkzjQi+7fSpSuOuoDB+ITfme9gx1xQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtYZOB8aHyrIMweWo1vT9VX3/oWJEh75hN5R4+9YY7ybrH3K2R
	rxwdJD/ZD+m54WVnqUuPFtunbCgOSy3r/afd7LWKx1I/K1RLTnJ9mxb1lTSuZeDvk744r9SPukd
	X0coH8jgA82gsQp+S3/n7iGiwj4dFutZmCt+WMALakny86Jsb
X-Gm-Gg: ASbGncuEAR3IXstSBuq3Arnou0M2ZXbaSGLqjnzw6iYk1P5ogApvoaPAUAtueMd298M
	tvSKqpfG7PbHqZtpCNrRy3fD7BV+UWTBG/PGfOZowKARkqDJWNWDV7k+fjdMSmtgAppuATfe5NQ
	7pa9656No=
X-Google-Smtp-Source: AGHT+IHZluLxn/bf6cpXOKGWEyqUac+5KCT4ifo6lWibr2coM7mUN1dentZWywii8b7k2GRtSbindSr/ckho352WQ5E=
X-Received: by 2002:a05:6512:281d:b0:545:56c:36c7 with SMTP id
 2adb3069b0e04-5494c3521famr548226e87.41.1740698084625; Thu, 27 Feb 2025
 15:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740157176.git.geert+renesas@glider.be>
In-Reply-To: <cover.1740157176.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:14:33 +0100
X-Gm-Features: AQ5f1Jp9E0NSS-IJffWh9Wl4UjBU0iqQJd0gDAq8jLGonF3nfq7IUtVCYMpAPkI
Message-ID: <CACRpkdaBuFm=xEs=39n9pboV1J-SjRKUyKo8GPY_EjRKuUvAsQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.15
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 6:02=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.15-tag1
>
> for you to fetch changes up to ea4065345643f3163e812e58ed8add2c75c3ee46:
>
>   pinctrl: renesas: rzg2l: Suppress binding attributes (2025-02-20 17:33:=
08 +0100)

Pulled in for v6.15, thanks Geert!

Yours,
Linus Walleij

