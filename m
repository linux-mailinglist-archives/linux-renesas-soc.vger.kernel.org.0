Return-Path: <linux-renesas-soc+bounces-15565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21ECA80994
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9FF4E5484
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30254279325;
	Tue,  8 Apr 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mro5MDSX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09FB26AA9C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116068; cv=none; b=TdZ95hrfGHMrjjB3DxuU2drAg/525tHm19N3sI9Q178Hz5f+6y/9aPT01djxXWRUz9c92C4GELTfIekxl9gcEK3slRvX+DPY0LKSzYygzV8RXCs30sss9DG6fdULwiktSRpn/3TUjxq6Au+r2biFZpjIr/9k42nEAael5DLj88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116068; c=relaxed/simple;
	bh=qLDMITlHkmBC9vQ1ZL9QNBFWIiCZvfOaQm2ASCOB0mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=LbQpN2KvTBdRKinujiJU+GlQZZcbjDIANQWFtcwiYPoE7aE2GbaEk+V25boquW1tdf4v0HpR5HBufW/DgJUmVIyWIm8rNQ7x/4zM/7ozr5kueLGos9l/2pvroUEBTXLxaBV9GhRn7Z4sERZ+3IWYz74lgWZl5aBoQ4dCciHQn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mro5MDSX; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ff07872097so50460447b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 05:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744116065; x=1744720865; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h31NWp5NG78cqvJiAi8jWfDqzeGt0I+RYA/Hp3KCiI4=;
        b=mro5MDSXuxl+rI7To12fGqD9IiM/keuTFYIaWFjgLvnG2Jg6pDdRh8WcqsXF/O8vqa
         JUkA2qC8vtbYpxA/VvXfvrdk5N1+SH6Q/wyXxmehvCNl/esLDj66lBRIRPWg99NlpLBN
         OMfzZ/zdyJvGau5iJUtOoNN8sI3MC6lfqpWLTDYMQAnntEPeOUW9BJWNQHPBBjbLuepl
         /QXr33wM8dRPceI2uG1NZssBGSF0swj7W8Msy4hME5mrvm2MRNH1Y+vIEBt3FdgemTWM
         5rd+LzFBpfwwTNLciFGl7aR6H8tt9ZsvbYXqrrD/IcmzXDrhpjDJqmgEosxrQaPSUANf
         0qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116065; x=1744720865;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h31NWp5NG78cqvJiAi8jWfDqzeGt0I+RYA/Hp3KCiI4=;
        b=CBHUGpGFrn+mxNlmW+FGqEfFJnneSamYe+R6Vq3stgvYdlARqhn6uuzm+IXuk2eokC
         21JRbpbc/Qi48vMrBfbnfrIHNhNsxN4UOGXf5IHj2FMvkqkVwJKtt33lf7HA4jv4SIiY
         gaaB4eKaHv7oBzHVGrzG+94N/4Uu2Ey9PM46A9eOS5mAtSnbL8DDzEmfOtafiEqmfQ1/
         lUD6WSwJVX5gPuHjcddgngI/FlXqWUA5Xjj/D5VRcKJthJokUcY4vq+H+9I1gCFzBzmk
         xsUZ9NYqqc+clAb8Spaep5W0VNmxNrA1f++2devQ6bsQpU4KgHovnCG+M2NjDq7/JemA
         S1WA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ObVJVF7FtSq4gP7cxkTOLwkP5gcn0Nv0qAr1PKvSe3AFWSM/HUYi1I0BubU3N2Y3Biwdx54Qg1SG1EopqQm5NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygLBj9q8b/KUWfdaLvJgfNcZPy8oBUXHMpwqH/pKp7oddw0NPG
	MuaLtlwE4ua69c8GcDs7rPo115AmrGfGMfwvC0/xB8Z2nbg19OPngMX+gd2emSI/aVS+oAchn8E
	t5S3L7UNWenq9mLgv7EGtQhQr62DbhT6/5O1T51rgme6LPS6/rZ8=
X-Gm-Gg: ASbGnct1hsgsOApRI5UTRNjnIWBghUnD32f4oWEvV2UqZ54R39AH3jL4PeDWz8RpZ/y
	G8bsOTqzDRLkm8KWITjBGwQ7ok3bcoMxUeZ+yQIhxVlt8HbcjZlFDVXfyDOurwgOvYHhNGFrbTw
	MfpkZJVgbRS7+1FPPyNyG++0DqDOY=
X-Google-Smtp-Source: AGHT+IFi2YP0XvF5bDF9Jq40DyUHv5Ek50fAkz+eQJ5TMfPtzso0IeWqwOf8skCDPmoe9EJ6s/zbwELjZkMpg6aQGmQ=
X-Received: by 2002:a05:690c:b12:b0:703:b8f4:5b07 with SMTP id
 00721157ae682-703e15fc48fmr281518977b3.26.1744116064907; Tue, 08 Apr 2025
 05:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
 <20250407152759.25160-3-ulf.hansson@linaro.org> <Z_TZxXORT8H99qv4@shikoro>
In-Reply-To: <Z_TZxXORT8H99qv4@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:40:29 +0200
X-Gm-Features: ATxdqUFxgJAtDDVpsnTI2jHXWceVL4cabvWXC0qH_HhX-upbo0zNv7dP0b9TEt0
Message-ID: <CAPDyKFoOfNWa6b0jF0-a-imKqdDJQrdJe65OaOj3D0upmS7VXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Avri Altman <Avri.Altman@sandisk.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 10:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > @@ -2187,11 +2198,12 @@ static int mmc_shutdown(struct mmc_host *host)
> >       int err = 0;
> >
> >       /*
> > -      * In a specific case for poweroff notify, we need to resume the card
> > -      * before we can shutdown it properly.
> > +      * If the card remains suspended at this point and it was done by using
> > +      * the sleep-cmd (CMD5), we may need to re-initialize it first, to allow
> > +      * us to send the preferred poweroff-notification cmd at shutdown.
> >        */
> >       if (mmc_can_poweroff_notify(host->card) &&
> > -             !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> > +         !mmc_host_can_poweroff_notify(host, true))
>
> Ooookay, I think I got this logic now. I think it makes sense to make it
> more explicit in the comment, though:
>
> "This is then the case when the card is able to handle poweroff
> notifications in general but the host could not initiate those for
> suspend."
>
> Something like this?

Well, in my opinion I think this would become a bit too much comments
in the code.

The rather long function-names "mmc_can_poweroff_notify" (that will
change to mmc_card_can_poweroff_notify with your series) and
"mmc_host_can_poweroff_notify" are rather self-explanatory, don't you
think?

Kind regards
Uffe

