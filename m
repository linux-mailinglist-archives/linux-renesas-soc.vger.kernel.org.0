Return-Path: <linux-renesas-soc+bounces-25531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB6C9EC80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 11:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CEBF4E1C1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 10:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0392F12CD;
	Wed,  3 Dec 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfyVPbyo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484942F12B6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759343; cv=none; b=XTEtIDU7UVbhkK0qko/rti01RhS6RGMWSo5yaaHBV/drHnn08aeOEQ4hdn4ggxna/oYgwmOos4ZdjwpWncdXx0Ak3IMy0wcpSU+UuZE3RgnB197xTOnfdhLa+uqCgkoaRWISRwob9VJ/6AbRK3oU9OyGW7pwSf3dl2bMWjKa7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759343; c=relaxed/simple;
	bh=7hvrDpCzVwMMf9J3QUL4WnffrjSWD/TKVvCia6r67yA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ly9heJYhCwXC8u1HKJzrtQ5q/+kqwSv6wFVO9ni05DsB7k9TGy51BzjOm64miOCfLPxyMnmcxwQUPaNb5AcGrCHjZWGVyOx3hoxDkq/8uaofPmbUN1eRP8fd336liiir7jIedQR9OYdDypKLhnW/mCg8i1Eb8BRzWA10wyU5t+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfyVPbyo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so4112615f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764759339; x=1765364139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEBoGpJiaUOw40Gk1Uzra0v+QoWgQ7txPfh6Qy1pQ1Y=;
        b=nfyVPbyovsLC7VRsKg4ifEhXkE8MX52WgYut5zKcRCMRsQtyeuyhaC316HMTt9Ez3U
         EeZhq4VoQj7R66ag+B5+aVmoNvXlGjUZT/N9jTG9dZttqRv8t6uZXPJQU5OH9zehnD+0
         Lq91zv1WGqoycvhOw+gznaoY1yw0U+18mZvMf6wy5giwglxzy0azawGS6w+s/nrBaV5H
         RkN0yNuhmLsjSc+p3VZg7Lbwdxc0CYg4PUau3/EYrtJD5T+cCnmePjhXGyKlAdJ1Dwy7
         NWMwDnBo8gux2vYW6xoKEMsOTRazbHPOcvjMJyuZ2SNj3PaKpTyIrJsZ74JKpO8fLydM
         JZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759339; x=1765364139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEBoGpJiaUOw40Gk1Uzra0v+QoWgQ7txPfh6Qy1pQ1Y=;
        b=SCJnN6CIRtcAMvu76YW3HXxA6oYxvUs4jUPWmW87Q6aWs0KCjli9CnkjglT5UUd/l3
         FbQ2FW8qwwPe7XY4Tk0ODYjX3wlnDJhdWF52zC+9nyHo/jmAyiGT7JkR43cVbHirJgUV
         rs/suCp2QOtaNi7C5GFaRQrTupSmIW3lC7ZGwKpdwfmIWnrJvbE8u6s4DjSTCYqaBox6
         mJEaKjuU+IYD6CTcubQzb2AtWfw0byI/5c0oAKs9gnOaPKCatyZD7qG/dxkNMd8Rt531
         EhtEwOMxPemfbYJYQV5eAHlBw9uEF7rkotedZ+slbxS5MJDMnaFuXmahZhf5n5dybgDE
         ec/g==
X-Forwarded-Encrypted: i=1; AJvYcCXUNdA0bk8OkvAlgJtjfwUAyoKkFL9TFS+ZwReeXccEag8s9QuDVzDksURlN6zZKR5lPkEIoNWbmIO2OpxTsCyUkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSemBTsgNNzpOohJV2OGrbVXe4pfiurag2XaP1XcalpxXccP7E
	bn3En1Qj1E36AN7rg+MeFsvBXLNLKCN16B3Hjci6Yxei/F98oLXS5SjR1OqzZg==
X-Gm-Gg: ASbGnctJCU/tiHCnvVIEnY/n1YHQaWGz8e4d85V4jGyPxTlO5z86/2BRqUDBhcQYe3Y
	JMxRQTG8nKiPoWT9yXrY2Q3QV7y84CjZsRE9fsF4fdDsyZOFFPlMntonC/suBt66YMDNYW7odcp
	Mu1j9/Nz8EQEklNYnhdlL07QUJHVhOlNVzYRF1GmOfTlobdTt9oVRE344Im4PxUD9F/bW+knxJ5
	7SrWPIj9T7cy6/koMWWUeudYZjZXniOlxO4scgMg9+zvatY0J44w3Hd6CsDMwFenzkNUDa2/WYM
	+wItjuHWNBHojYxfij6569eLShVMZxe7geNMlLEnONhfU5RPQOOTNQmLIdyYfqyFjDYsZ7G3aMT
	cD3lyoAMU+UIGdnJkLe8Mmy2Enlsq4x7ksUoy/XcENtUCwRuZXg+4Jb/EnnCT5vlVgLyQ2GnyCv
	+TTof/kQGrTO9uHCnrOXPSGy+6vgFAPznYohrDfQKjeBv70/ovTy1c
X-Google-Smtp-Source: AGHT+IHSA/tWqVBbKIa7sKECDQ7+CXlcfAawXDkGUPJgoZlUMCAZEHFAsX/aQCIapoqjFSaKl9GzwA==
X-Received: by 2002:a05:6000:2dc4:b0:42b:30f9:79c9 with SMTP id ffacd0b85a97d-42f731bbf9emr1687815f8f.37.1764759339340;
        Wed, 03 Dec 2025 02:55:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5e3857sm39474689f8f.19.2025.12.03.02.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 02:55:39 -0800 (PST)
Date: Wed, 3 Dec 2025 10:55:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally
 <dan.scally+renesas@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Khai Nguyen <khai.nguyen.wx@renesas.com>, Hao
 Bui <hao.bui.yg@renesas.com>
Subject: Re: [PATCH] media: rzg2l-cru: Replace usleep_range with udelay
Message-ID: <20251203105537.339ba29d@pumpkin>
In-Reply-To: <aS_4t5q_foMuDyAl@tom-desktop>
References: <8d9896e0482a1e04ae8934a1bdaaa7de73f919f1.1764691610.git.tommaso.merciai.xr@bp.renesas.com>
	<20251203023552.GM8219@pendragon.ideasonboard.com>
	<aS_4t5q_foMuDyAl@tom-desktop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Dec 2025 09:45:43 +0100
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:

> Hi Laurent,
> 
> Thanks for your review.
> 
> On Wed, Dec 03, 2025 at 11:35:52AM +0900, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Dec 02, 2025 at 05:08:41PM +0100, Tommaso Merciai wrote:  
> > > `usleep_range()` should not be used in atomic contexts like between
> > > spin_lock_irqsave()/spin_lock_irqrestore() pair inside function
> > > rzg2l_cru_stop_image_processing(). That may cause scheduling while
> > > atomic bug.
> > > 
> > > Signed-off-by: Khai Nguyen <khai.nguyen.wx@renesas.com>
> > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 162e2ace6931..1355bfd186d4 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -369,7 +369,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> > >  		if (cru->info->fifo_empty(cru))
> > >  			break;
> > >  
> > > -		usleep_range(10, 20);
> > > +		udelay(10);  
> > 
> > There's an instance of msleep() earlier in this function, surrounded by
> > spin_unlock_irqrestore() and spin_lock_irqsave(). I wondered if we
> > should do the same here, but that lead to a second question: why does
> > the driver need to cover the whole stop procedure with a spinlock in the
> > first place ?  
> 
> Good point :)
> Mmm maybe the only critical section into the
> rzg2l_cru_stop_image_processing() that needs
> spin_unlock_irqrestore()/spin_lock_irqsave()
> is:
> 
> spin_lock_irqsave(&cru->qlock, flags);
> cru->state = RZG2L_CRU_DMA_STOPPED;
> spin_unlock_irqrestore(&cru->qlock, flags);

That doesn't look right.
You pretty much never need a lock for a single assignment.
The most you need is a WRITE_ONCE() - and they are pretty unlikely
to matter at all.

	David


> 
> Please correct me if I'm wrong.
> 
> Kind Regards,
> Tommaso
> 
> >   
> > >  	}
> > >  
> > >  	/* Notify that FIFO is not empty here */
> > > @@ -385,7 +385,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> > >  			AMnAXISTPACK_AXI_STOP_ACK)
> > >  			break;
> > >  
> > > -		usleep_range(10, 20);
> > > +		udelay(10);
> > >  	}
> > >  
> > >  	/* Notify that AXI bus can not stop here */  
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart  
> 


