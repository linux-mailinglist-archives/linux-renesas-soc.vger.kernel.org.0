Return-Path: <linux-renesas-soc+bounces-21826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22AB54FA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 15:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB8363AB293
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5CE30F529;
	Fri, 12 Sep 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8e7Z/OA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC427BF99
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684092; cv=none; b=ZylIr219iK+EuwUYWUiQYuJG6SQmWTsxwRVA9UUUpQdDD74z1p1embRX0bIStELDdPbtPeoXbq8QoKKsXwGLbOaVUF9AAC1ZeB9yVbkM21kYA2M24bIo9VgjLemxPxOoT+TP62VSXlEnV2dG6n/tpo8PA+bTL2fwIO27lYNW8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684092; c=relaxed/simple;
	bh=utugK4HcYY18T5CEwLLLvgU2oRcmpLnYaZhUun8E3dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5ShlZ/uMNOLDYjagC4bgahUFM5azscQLHgRzZtkpXMW2wf/5rftPFfooWhYZsTUPJkflj+ZrwgqcdowvwTvKZ6nZHCn2mFOwIhpSyGhRve2wTLDHWkpgPxMLC76emViBIUUYxhiL5Z10oEpPx9/zPdWvruwVNm0XB86YBxQb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U8e7Z/OA; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e96d8722c6eso1317172276.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757684090; x=1758288890; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NMoRsZDotQQreQCt//iZViK8n2fFjlTpFk9lhVbhMl8=;
        b=U8e7Z/OAo63BAc/rUXFgTYt/pAfB9UE1vutb55p7vqQlKIU39lrD1tFi4LETJRGIsz
         kUGZvzBTUiZVuSY0eJqRXDM3uSfI0rxNGQ6LHFpWPJwAZGdMLkS+NGo+gvSOXYPWmhnt
         jNY8lJZ79KcaB/lPfSb09T4z7eabgGo6/S/HG8l5pAnI/wSnZIQweGyJ0ksgOzYl6MAA
         u8DCnlhKa6HAcwzclzxNWHVLvMfA/fqhWtBYx0e7s9YcALvIS9UO3jsDzG0iN9a0T8qH
         MlF76j72+i0P+NKnjOhw4igvNZcz7CLqkvYYAVn/xM7v107VmHn82NzQ8kvLWVEo1w3X
         8ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757684090; x=1758288890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMoRsZDotQQreQCt//iZViK8n2fFjlTpFk9lhVbhMl8=;
        b=RLGzC1/dqFwMz/rZuyHJzEcK76WdJIorm+7vZ1xJ3qPmEnObrPVV+2fS+RdbetPo52
         6mY1OqCd8NJix6bdkDvbE1KrTqgkPEO99uS7Lx1jgpF1QJCe4qYOBo03bXgHNDOVzr9A
         98bLAbVaUco6ZeGbcfw/4ylOf0gbtsuhooCyWEd3RTFZOVM5+qybE5h+mYuUIHEQJkS3
         aHPPzaDXC1IIjL8FObTECV437bNXzxxGdkjAv6EqmgLTMFBQCFGLCI7leR3qzq/hsXby
         RbKKLNW0oErkiJWJ5iXhkPXRQRXjh6PW5GoOrqMvWa19/iQtY+T480jz9Vd3oZPZyL4B
         CglA==
X-Forwarded-Encrypted: i=1; AJvYcCXljIS8s/FR2FpztMmaCIyUTlGwY+zdqPfLXHR2a+04CWGFu9FgPHB9I0sInGEXfTlusWUOd/KZO2TQ07eYKgahLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIRCNWOsatv6nVPt3aUudPE2o8SAP228ggaVvRssqxYLq1hyo
	01imFVhoyRvqJ1nsBuN66+aTuFVKMJia0wiBThIfqMXLns2couoc8QGXQihmycvMMTQrSQD6FJP
	Ph8VHwwFOxXrKpfQcRORlG459brjRRdXdVTVJrtzdnxFuh75bOx0S
X-Gm-Gg: ASbGncvLorSiqxGpApa2xQYm+2M6e+GW6VLJSxOgQH0qv0AU3+hVl+jwGOzzRlbsONR
	DbOV9IWVe+61EyIBx9FtNDIAoIHVd/Xr/PM/SGpZ+j802TOrClmuSgfNV6S5k2H19ukPSGA9FDf
	5WCbEMITx8/t9+NEN0XNOwjscdDnPynGq1xTk9Gu2S0aZ9sQV8PWC7XXPGWTrSceRHiqm3Yfj76
	gymmvpo3sCsJunLCz4=
X-Google-Smtp-Source: AGHT+IFVbjGOXpmv9Rz9ElJzGIgUxQm7xkANKyEMh4qj/MGGZlpYVw7OzTsjt8Ypn7pFOkm0TZmE85K/yB72VFG+JCw=
X-Received: by 2002:a05:6902:1444:b0:e95:1a49:9735 with SMTP id
 3f1490d57ef6-ea3d9c74780mr2633370276.43.1757684089646; Fri, 12 Sep 2025
 06:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8b73e2071a1d87c8d09b8bb24fc35f371779c2f3.1757000061.git.geert+renesas@glider.be>
In-Reply-To: <8b73e2071a1d87c8d09b8bb24fc35f371779c2f3.1757000061.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 12 Sep 2025 15:34:13 +0200
X-Gm-Features: AS18NWC65p2KribxIbig11q4x3BqzMOY-lu0OzXE__g-0uWV0PjaqNrYbfkqnZg
Message-ID: <CAPDyKFpRbeWWjba_uVQzjEARPvQUBpoqPiAnSz7b96S_ET_zgQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: Remove dummy PM resume callback
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 17:35, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unassigned system sleep callbacks were always treated the same as dummy
> callbacks that just return zero.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sh_mmcif.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 413c34585c90d57b..bf899c8e38f517d3 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1579,12 +1579,7 @@ static int sh_mmcif_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int sh_mmcif_resume(struct device *dev)
> -{
> -       return 0;
> -}
> -
> -static DEFINE_SIMPLE_DEV_PM_OPS(sh_mmcif_dev_pm_ops, sh_mmcif_suspend, sh_mmcif_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(sh_mmcif_dev_pm_ops, sh_mmcif_suspend, NULL);
>
>  static struct platform_driver sh_mmcif_driver = {
>         .probe          = sh_mmcif_probe,
> --
> 2.43.0
>

