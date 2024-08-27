Return-Path: <linux-renesas-soc+bounces-8330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A301D960431
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 10:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57663282C3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 08:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA22415535A;
	Tue, 27 Aug 2024 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iFgxyKp2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA817736
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746785; cv=none; b=NWPOGsrjbRrthuFiWyIdvk08Ll/oLGL3mC52HL5LeCEH62KeBzEa2fbrdZSrBNpej6GCms+NcgSfr7SvLsegARmMgwURSe16LuzlEjSxsL91VTDAjZOVaoKOJeOdGPAocI8bqWaaLQIvmcr1b0CXwMgc8O3NjgY9zFRJgD5lrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746785; c=relaxed/simple;
	bh=spR3CGSFlcWxd61znYrOMywbunOudD26HRQTshpPnAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtmO1JNxE4/GBv53+lUNxwUotAZvs0Cp+h4Zq6J6D2fQ44K/ZYkjA3stIhpLYPiiOfADDh5yOR6RNbGPCSOg3xJjlX/2Mimv8758dng2ANMkkTPqBp9EuyQd3Ue4+PofFzhYfPmAL22qxpX/MwJWB6klSsJ3/R0ALf+LlKY0VCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iFgxyKp2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201ee6b084bso44103705ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724746783; x=1725351583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huD3ev31mLebmA06NYxn0TFHXgDRdCiQozZGR5G/ENM=;
        b=iFgxyKp2Jp1jrjiJCGOqeDCqzu22EdQX5fHSaCaxx7eiu1a4aoJDChFZLTXmQw/Or9
         6CxpdvdysCvmA84B7wSb34K1fZ9JTqLzZW65oIolMqSsvL/V3TTOvdtLffaKnvJwuMCl
         19jUCQn/UThCGdj0gY0K+7cTlIrXlBnrpaPOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724746783; x=1725351583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huD3ev31mLebmA06NYxn0TFHXgDRdCiQozZGR5G/ENM=;
        b=tlo8X48CzLwunLY89PlQHlHo1ur+3F1B2tLBajSXOXJfzkPLs76b0c0MgMCS7wj3Iu
         x//OEpeCvvEJsNOP120075GoqJseQWwUgkSGuOF3qRF+fbrRmNHwtV+oCgaGgeoBlqZO
         sotGbLwbzA4BK4xpnYQcw6W6MJ5PbJdWyMWUoqQllmuwpd6YX4msL+o4AQ5GdKvZE5R1
         MUuCGG+Q5YTlJpREZOoL7xfK5M/LNQ5OSndd/UIkT6AgtXRZx6zgl4CQdK5PDSPIgum/
         e5gHXi6Ngr1mWzop4PJSEzVJFQDY3mCDYVV9S2MsNnsxswqOucqyGcOBR7EYvvJfBKhv
         GIDw==
X-Forwarded-Encrypted: i=1; AJvYcCVJIhNzh+XIgmElQ2MQOHtsIR4Sk3SVAGLjn0KLxrIriSv0eptBklEeGNVk7dEna2cuUZNOfTBWvbaFUhdUPfFIuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr7G9GQqp/KiklqPINKNmqk8lwwglTfogf9x6EuXCE+o9gieO0
	8NZZZssorJxRnNneYR1CUdbSuYANPKlj7B8QI3lpX+yNAjfX+1J+rNpU5K1yaQdyM5Y/PJvA8Vw
	Aoed3
X-Google-Smtp-Source: AGHT+IHF8znht9A2ki5lNA7uVy1+vKGPvY56BBl/7asfWXc3WWygmmtKq+JYZ2ERoi/NP+HKFlmy1w==
X-Received: by 2002:a17:903:1c9:b0:202:3469:2c78 with SMTP id d9443c01a7336-204df45fda2mr21559055ad.28.1724746782654;
        Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038558081bsm78090515ad.104.2024.08.27.01.19.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201fed75b38so131165ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5gbB/safeczsihxfgTgI0WXcc+xYNLFLKGqajtIVNX3QTw3kBwMnOgI1atrg+kzCzA+OI21w6AqWmorBEzXYkPg==@vger.kernel.org
X-Received: by 2002:a17:902:e5d2:b0:1f9:bc99:d94a with SMTP id
 d9443c01a7336-204e4c627fdmr1870895ad.5.1724746781507; Tue, 27 Aug 2024
 01:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 27 Aug 2024 17:19:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DDwFTX48EPksjqQ5bdRWUkQn+ZCBUbKid2H1GeZZSzOg@mail.gmail.com>
Message-ID: <CAAFQd5DDwFTX48EPksjqQ5bdRWUkQn+ZCBUbKid2H1GeZZSzOg@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Drop minimum allocation requirement of
 2 buffers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 8:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> When introducing the ability for drivers to indicate the minimum number
> of buffers they require an application to allocate, commit 6662edcd32cc
> ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
> structure") also introduced a global minimum of 2 buffers. It turns out
> this breaks the Renesas R-Car VSP test suite, where a test that
> allocates a single buffer fails when two buffers are used.
>
> One may consider debatable whether test suite failures without failures
> in production use cases should be considered as a regression, but
> operation with a single buffer is a valid use case. While full frame
> rate can't be maintained, memory-to-memory devices can still be used
> with a decent efficiency, and requiring applications to allocate
> multiple buffers for single-shot use cases with capture devices would
> just waste memory.
>
> For those reasons, fix the regression by dropping the global minimum of
> buffers. Individual drivers can still set their own minimum.
>
> Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field =
to vb2_queue structure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 500a4e0c84ab..29a8d876e6c2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
>         if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>                 return -EINVAL;
>
> -       /*
> -        * The minimum requirement is 2: one buffer is used
> -        * by the hardware while the other is being processed by userspac=
e.
> -        */
> -       if (q->min_reqbufs_allocation < 2)
> -               q->min_reqbufs_allocation =3D 2;
> -
>         /*
>          * If the driver needs 'min_queued_buffers' in the queue before
>          * calling start_streaming() then the minimum requirement is
>
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

Thanks for the patch!

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

