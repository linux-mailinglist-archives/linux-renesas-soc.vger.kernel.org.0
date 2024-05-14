Return-Path: <linux-renesas-soc+bounces-5360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E68C57B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A2141F218EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7971448E4;
	Tue, 14 May 2024 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSkfZwZb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB886D1A7;
	Tue, 14 May 2024 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695851; cv=none; b=ZIJcnALkwkJYYaKmUSo8Ko7tfIEthOokpCzGENsmwHBruTTjxP5E20R2lMW85YQSgGOonDKIJ2G4lcTXJVaXuBPNymnxZjoQxTb2eJ9ZcAatVsPOgOhlvuBnzfvEuJCI+iPf3SvoW1J8NHmH4xXVjFov4FeyEBqBSUddqgQBx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695851; c=relaxed/simple;
	bh=idsFV/plXziBP7biXwxYVnUuqVUAbKoKYBEZdw5FAvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JA/XdKXEA3f9qH4Bq74rdQCT3f4Jf0FDlswnNTutbc0A9W5B744ojDH7un0+GSQMYhNTW8NEi205OjKXBsmDMRMgslHtxbkH/UkfokNjkp7ORlRftSlJVjV9Gl1fhq0jK/wLydlPfaGDgi8umzBsYpf68S50OgGwdOr8glKaiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSkfZwZb; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24157800275so2723306fac.0;
        Tue, 14 May 2024 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715695849; x=1716300649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKVKT7Rt3U1WpKVzL3CBlHOoKp58lJ+CMFeITZ8zIQc=;
        b=aSkfZwZbx3umF2pNLEzQnYZ5KFM7V8j0VRQOM7hgEdH1zios7zo5n18cKbb7eW77Uf
         riinQFEPCHlM5436EIAzlQwLpAnys3yku/gWLvhJsSmdHWa3OO6w5TLGwulwYlGsRLCZ
         JcduN7UO7v5BSgMTOsfTyaLXpL/46SzLYxw6M2IdIGVCXBmrgbO0+33Cz38RKMwyjgFa
         qQxOuP2gW+NaaC8WtriIn9CiDwezQuCEMu9Z3br1Ks8jh1CuM7d7t9ZRYC9V9E4M5Un3
         S384iWrNeArxC3XK5oRB1WeKehIuYGQz9RcWpwdIDV1ZEEXKI6simCVP7C+hncihiGN1
         Ksrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715695849; x=1716300649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKVKT7Rt3U1WpKVzL3CBlHOoKp58lJ+CMFeITZ8zIQc=;
        b=B/zCug4Kyavyask4HiP+0Vwrl69NhFf+OGy+3QJAgw5Cb7zM/5XkKBJYIdEShxsmYO
         YDd9e+n313Yy12tVHOwvuZJG6y8KAjC9ZSx//uAevCam8UfG4UUA6olk7OtCccNKn8GA
         3es58V/UUELM1aZMW8rvXRu3BxFGow6V1cP00gQprfsCTQ9E3WBLRjZluViH58GF94GF
         LnfTaqu35Rb/LXUG/fvHqgqpyae+b6EbEW3G6DlAIEwkifwllk0hay1+WfR4e+KTGZmw
         JnIs8sK19/dzX2HDmP17dzmRXBeph2vnHzNumR8e8gcSVOQPX62WbWgxbEsabj1nfDSs
         4oEA==
X-Forwarded-Encrypted: i=1; AJvYcCWZIZ7aIubgJa13UDW/2DtfHmGoGnOhksJVPlCBaEV/luG3wV/TLeh+RZ6Gr4gVzWdmJnKR8aOgIG6yFpcQQoAFgeF9Ai54urMeaaPi89oVK0s=
X-Gm-Message-State: AOJu0YyOZqZcEqX2I5ZKa1mQu/u+k6GK0chZfGMPW0Taox929awx+s0G
	QatqkAevgAGizolJD7dtyq/BIWKwFU0e7uMHO+59HWnUPOcRZBEFFHObq9Lx6+1udAig3XQeDP6
	R+gxAj7C49p/TDUZYdAbm8N3IsFo=
X-Google-Smtp-Source: AGHT+IHMMVIzd1ymR9V4pGf8QXhdu90ekywDYKwjZulJuTlri4cG2bUPWsLUav+alHG9eZksrLEhZdmotW+OEEGDZDY=
X-Received: by 2002:a05:6870:d112:b0:23d:225a:9443 with SMTP id
 586e51a60fabf-24172f5f0acmr15280010fac.41.1715695848695; Tue, 14 May 2024
 07:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418132602.509313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240418132602.509313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 May 2024 15:09:56 +0100
Message-ID: <CA+V-a8vp32HsQsQDKD7rPK=Z=SoCk1SxxigM4FP1G=B7=jOz9w@mail.gmail.com>
Subject: Re: [RFC PATCH] reset: Add devm_reset_control_deassert helper
To: Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 2:26=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> A typical code pattern for reset_control_deassert() call is to call it in
> the _probe function and to call reset_control_assert() both from _probe
> error path and from _remove function.
>
> Add helper function to replace this bolierplate piece of code. Calling
> devm_reset_control_deassert() removes the need for calling
> reset_control_assert() both in the probe()'s error path and in the
> remove() function.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/reset/core.c  | 22 ++++++++++++++++++++++
>  include/linux/reset.h |  6 ++++++
>  2 files changed, 28 insertions(+)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index dba74e857be6..a2a6eff8e599 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -592,6 +592,28 @@ int reset_control_deassert(struct reset_control *rst=
c)
>  }
>  EXPORT_SYMBOL_GPL(reset_control_deassert);
>
> +static void reset_control_assert_action(void *rstc)
> +{
> +       reset_control_assert(rstc);
> +}
> +
> +/**
> + * devm_reset_control_deassert - devres-enabled version of reset_control=
_deassert()
> + * @dev: device that requests the reset control
> + * @rstc: reset controller
> + */
> +int devm_reset_control_deassert(struct device *dev, struct reset_control=
 *rstc)
> +{
> +       int ret;
> +
> +       ret =3D reset_control_deassert(rstc);
> +       if (ret)
> +               return ret;
> +
> +       return devm_add_action_or_reset(dev, reset_control_assert_action,=
 rstc);
> +}
> +EXPORT_SYMBOL_GPL(devm_reset_control_deassert);
> +
>  /**
>   * reset_control_bulk_deassert - deasserts the reset lines in reverse or=
der
>   * @num_rstcs: number of entries in rstcs array
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 514ddf003efc..e41e752ba098 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -31,6 +31,7 @@ int reset_control_reset(struct reset_control *rstc);
>  int reset_control_rearm(struct reset_control *rstc);
>  int reset_control_assert(struct reset_control *rstc);
>  int reset_control_deassert(struct reset_control *rstc);
> +int devm_reset_control_deassert(struct device *dev, struct reset_control=
 *rstc);
>  int reset_control_status(struct reset_control *rstc);
>  int reset_control_acquire(struct reset_control *rstc);
>  void reset_control_release(struct reset_control *rstc);
> @@ -91,6 +92,11 @@ static inline int reset_control_deassert(struct reset_=
control *rstc)
>         return 0;
>  }
>
> +static inline int devm_reset_control_deassert(struct device *dev, struct=
 reset_control *rstc)
> +{
> +       return 0;
> +}
> +
>  static inline int reset_control_status(struct reset_control *rstc)
>  {
>         return 0;
> --
> 2.34.1
>

