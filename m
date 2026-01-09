Return-Path: <linux-renesas-soc+bounces-26561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14624D0C6C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 23:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E914303B18F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 22:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA272EA169;
	Fri,  9 Jan 2026 22:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyfYkk/T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5D303A0F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996679; cv=none; b=f42JaRTFTbGizat+i+M1Ue/Lnjyn/4to+v1cYvZyPnRlQRN6UPFtNpFnzMid1Po+hSyH2QIMGWtNsbfuOR7JDHPblZvdOWZyungHJi5OCFxmw1vUrPTgLrMhuYaDy5As/Ypp74130jpg/XxXxQXYsnLiIPjStoZdBq5JT5A8kAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996679; c=relaxed/simple;
	bh=R5Do4/w4LV+M4OYcCoPCvYZSX4xUkM8QUdWEFqvuFV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKADdNAi0ndyChbIiz3ZU6IW7r4+HWagBRdjv6XHARC/o98pUpPYknhuZaQmlHAhAd5FRKA8w/24FsrEDRcjw8s1vHda9f2Nia+jwBPDqSKYFSkRUTUQU/VjUKBkAsizBaGNFh3F7mWJk7RBlwbR1HVwxXVYmz4cDW/dQLQgYpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyfYkk/T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2395870f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 14:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767996677; x=1768601477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJAnP27Y4Fg6m5YuP6Z5EKo9hS0YnZFZlZA3ta9U+jY=;
        b=OyfYkk/T4b0Gry+v3qGDrW6ObyYXOyorBKJdyKd5wYntVMlfiu1f1ooB1KyAGVQKNL
         lrEwNu8xJ28xoJ352dsfJ+iqRCaHoNgcpcGI3J0luTsmz5JVf8etCcV6PdDwvBZxHlDZ
         J/Jtc+VlxcGTnAR0MT5nYY5faGKk4wfRH2lPVjWpPZazXIx9YwAkU4dx/N8J2DIJa5Iy
         QBjEAEfYh4j0iOq3gTogVCt1sM3V1WtZ99+1xXqds8SIBssxEk9m2bxrXU10p25vSXqk
         6S2PwavE/T2Tg7QN7yarC9/8TgY+T9Ud1YulEXeBlxE35tyzNxHFCPZDfQUcj2gRhadI
         vEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767996677; x=1768601477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yJAnP27Y4Fg6m5YuP6Z5EKo9hS0YnZFZlZA3ta9U+jY=;
        b=qMgrilHDsNAOFxC8m217QVftnH6XQYFGFkfTWQm0J0rtmv/Pdwz9zA9ev5bjB7LzFF
         77TZqQrYUt5ZYboAobGUSub5uudTpddjFT0/GzyiGpzOmuGvsq1GOR2rJKJhv+WyHrd0
         Cnga75ADZ7ux0yExuJ/K2qknq1p6TYP4rcvTmTEm5MKGH47SQeUMHvUJDMz1PZd6vMPs
         fJDkiGLJ1JMLVyabywpoExpXAPd8bKSVx/aNQ5OV1DsYp2W2To5csWaLzG8XTnyM1y6Y
         yUhRPp8998uJcy667hoi8+M+2whwrTq+x6qg05iPFuFfSBSceCzoqUKdtPXhMD3doYnq
         ch8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3QCzv0fvsSWa/NZ80bajO9f0/pronVxdK4NQqZww4EUHnTq6YwMDIn5XCul7DI1kaOIOIJQUUIsFl2BkVXdddIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvummN0zM36incAzn03Rl18Ry9lUdoYkwR1MVrYqTqJJtxLg49
	t2xSKqhBQuT0Jj09F7AKn9ZvX4aupsGEwgKh7husBeuvDIxObxWY63TQWYqTUanTe7EpY4mbBNr
	jGoXTAqGYAB4+VHyWlzKwGgxmFeChffw=
X-Gm-Gg: AY/fxX4XTwEduhtSbMG9KcB/W3DbwzNOdrO4UsO5E1GHVpz71AsPrvCUzngjdHyQP/3
	LSnR15C6vCizBB//8GENp2+xuO3oqyKEJb/Oxsrs5Uzj9xcMQACPfUqP4UTbAEdJpacIJ5LIXiF
	Io18wNPHooaGD7wiuTpKYodG7puIQlXaxVZeDfr0RFoMQygpVHxl7BzX01BYXDSdGerkyd1fIzP
	g3wjhXoF528T28xvIJOLzEt8ErmqY5dqD1PY6hWVoq0SXtHe87zMmMoZY5wdv6a3tZlDHqHu/aO
	WBS7Omw9Wr3apkJM10TVCldGs0MiDFD4jKigLFM5ZGjuXBZBVoibZjKKHA==
X-Google-Smtp-Source: AGHT+IEv9F2TE9alvzSAaWWvHAOaOzQkaWEQ73Q6cawx9cBLTLWPaIJAupHAzQr3PBKhgFozn6nbDHkKRuF6Z3FVUo8=
X-Received: by 2002:a05:6000:25c6:b0:431:9b2:61dd with SMTP id
 ffacd0b85a97d-432c374f48dmr14339503f8f.38.1767996676484; Fri, 09 Jan 2026
 14:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com> <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 22:10:48 +0000
X-Gm-Features: AZwV_Qg1Zb6okpm8iExAr_5JEcgpUrB_Ww7dFmqug7FTRe7N-V5EDDCfGAHEhBU
Message-ID: <CA+V-a8tmw8QX7T6yo3Zd6PKno=K9BseYRTTT006hWOHYrX2Cvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: rzg2l-cru: Drop redundant buffer address clearing
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:16=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Remove the clearing of cru->buf_addr[slot] in rzg3e_cru_irq().
>
> The buffer address is already managed by rzg2l_cru_set_slot_addr(),
> and explicitly setting it to zero here has no effect on the driver
> behavior. Removing this assignment simplifies the code and avoids
> unnecessary operations.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 34e74e5796e8..8ae6ef82a0da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -709,7 +709,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>                         return IRQ_HANDLED;
>
>                 dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -               cru->buf_addr[slot] =3D 0;
>
>                 /*
>                  * To hand buffers back in a known order to userspace sta=
rt
> --
> 2.43.0
>
>

