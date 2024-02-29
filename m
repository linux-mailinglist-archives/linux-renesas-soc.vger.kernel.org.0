Return-Path: <linux-renesas-soc+bounces-3350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6686CA8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 14:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D6E1F23104
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 13:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818C67E76A;
	Thu, 29 Feb 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtQCeEs3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8907E0E7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Feb 2024 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214284; cv=none; b=Yaz7TSJ4ed2WJafxQRo4MLYBODlDn5QO5OXvsB4MOdkcPxhjXIv9XxsZHM0dSdk/3Qs2GUCW0Y+e5ER7b6fPBL7RfejRmHn/TJxUh5Zy6SOKvb3/dgN0S7AsgXtvS6WKVHj43fh57gd8CxsOrUXiam8pQrQX+jk77O8wTBUj0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214284; c=relaxed/simple;
	bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDbN3noMgApH/hzU28hIjrnZiWKU0++LO4UdDNgZBHbC7t2FuSGSe/5MDUr5eWHvGSTzYz8VGCrmQcl4AfcJ/Artw7Qam+H8OAo+7m/RkNiq5DQDdquAOzWONSnNYwnPeGDJRpNo1Z52FVfir347hVcq3dnEjp1zoIa5K2+JiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtQCeEs3; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso1020387276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Feb 2024 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709214282; x=1709819082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
        b=GtQCeEs3kiF6VYu9JuoXQd01SaOVA25zptc9Dxf3N/ldn/H8BvGz4JZAJoS+UixGS0
         LV7ycB2jd3Pb1ZwOERbxC1SRNbm2TjBDUBMIBrir6cEEC8ta5rofFLJXAFXFt0+dEaIz
         /TNjT0wAMRB0oTSsU/osKuY6eAGjHn/ifs4QHRbAwpvKRPBa8/+Tqoo5xSXwDocVcLTI
         2Tk8pJ6V0iu0XfGRS7qGkKQzcX75FhGfseE1ymGG61I+1bgahaGaUVR3Sj/Yu0q8TQJ7
         x9oZmx6WNk4oYwCDatYW6LfZe0xKAjtaSwDfaC2dF60xayFhMBGCKTg91H6YYy8OWAn+
         EDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214282; x=1709819082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
        b=bLGJccwcp4Yogdf3aMArhnqFUOIfQa1LtCktz9rQlPLnphu6d8IgGIC8ox3TMzPqbo
         ccCrbfxZDD9QaXDy1hcouJk6qQ/ErF2THCBP1P6x67y+d4Me+IyZo4u83X4kwzKNr7dn
         FGtiIUaEydcDIwrIxXEsAHaoEDLwTxiayy5SEz41XCtyzI5aSun3cByBW6w1qQG1ZCAD
         2Feem4vGzzlOu1xhOsXMhtl1LyKlAruxYUFmZKo6Iymh9bp+OwBQWXm/FngzpqHmjSL/
         Exb3HaH6eTXIh93QGVF2b1AZzZa4ZHfDfiyd5e1tTw+G3jDwBKkp9kKlGdw9sSlGEEJD
         3d2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnh6P3MyBD/wukS3GEre9J+jJeXIul7y8r1T88rYsUFn1oZXVi/mEcMKCO1XPmMAu7KYH00R8wpE56ngF+HQQxggTVAIuljrAAHJ4TqGQtrU0=
X-Gm-Message-State: AOJu0Ywn+KS4Mm/ZbydXk+XiS+sHGCD2stqHJAM141JZvPcuvv0j7Cg6
	jMriBCG9XS6dfQwtbrIOmfOaMSehtYZWF37JmiK0ppzODp0BWfg8jHT72Fzz9WwN14r6FQspZDp
	LGjiYUIXeATrTzTvHbLdfMr4Q0ewEkPAUi8pevA==
X-Google-Smtp-Source: AGHT+IHi8eN5Wfh2JnmE1aIOt4CnlHTYtAv38O2XfHtZHksusIwxcm29Hb2iH0f+TCoc79GgOaXGUIH/luIX+BZx3cU=
X-Received: by 2002:a5b:a:0:b0:dc6:e4f8:7e22 with SMTP id a10-20020a5b000a000000b00dc6e4f87e22mr2044131ybp.62.1709214281995;
 Thu, 29 Feb 2024 05:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226191607.397386-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226191607.397386-1-biju.das.jz@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:44:31 +0100
Message-ID: <CACRpkdaPx51z15cdGKtZ9+KEMLMver1YF5QnzkX+XDSG+LL-eQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: da9062: Add OF table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 8:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:

> Add OF table as per the binding so that driver get instantiated and
> bind automatically when the driver is built as a module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Patch applied!

Yours,
Linus Walleij

