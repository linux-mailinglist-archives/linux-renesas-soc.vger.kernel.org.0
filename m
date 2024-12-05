Return-Path: <linux-renesas-soc+bounces-10947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74D9E5437
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 12:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AF4F1645B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 11:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEEC20B219;
	Thu,  5 Dec 2024 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdwT1rpn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D73209691
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398985; cv=none; b=IUr1T2lrQlCJmIbpzTLIes0LTbhZXAVvvVP+nAG0O4hVKNn64/RUMGkLp8D5L2r6KiwsdRucFzIgo46z8m0CVe3EZ3gz4G4e/KOBGYHp9yntQwDsjKiFjt659rfa/Bm7wEF9POQNilWBN3SygthOkd1G2Cnu6wJTCu3RZ6/3npw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398985; c=relaxed/simple;
	bh=QwW8hEKc2ZOq0UAnDz5EozX5u7ND1JQqpJqyq+GHFPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPidaU+xUusZ1CwGmUQA9NAycCTwIilQzxE81Ifq2/Xd+5s41kbSnH7IKDe6t/oCg68QQMpJX8bYE+t/PJfpZjax37oyhCYZQ0BxZCMXxNP8tzvsETa+efj8XLjivZVDCA6AbRQ/2M/kL56eugqiDmYRYAfnBw6YqhKWZ6TX0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AdwT1rpn; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e333af0f528so823832276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2024 03:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733398982; x=1734003782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=foW0/KGDo9eGD4oVVo4WypJSTUBY0HMIRisvLT2/meA=;
        b=AdwT1rpnmzOvoI8HzQP/Eco8TB8kZeNegVFmazVmm2jjdcYGQluNnAzwiYfianUEJj
         WmW/LejubxecCSwifWfW0MIdC2v4X/G9iAlt6TGvfeH1EoFzkx1P0knsu7R3W1U4rjwT
         U9+AZhNHWk9e6UQJemoj62HAqY5VSnOC4P9biA8KFxzcAInIleBY4Gaq5Mwb7BZRyPTg
         2WvRad89Ya4YMLgb2gJI3DxB4PUpUC7RZI9msav/Z7K0FVBZ4aihwQCdaJychVYnrM0H
         br3S+gulj79B9Q/nyFSPO4bQ+TCooztvssexDXJPVb4fjN347FEVuXvfxk0viscMnC8B
         421Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733398982; x=1734003782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foW0/KGDo9eGD4oVVo4WypJSTUBY0HMIRisvLT2/meA=;
        b=vKw9yJKMB0h19nRDUuk93auplJDP7jaAgpBJ0Ifcvu8YSCnxF69eC/bMjCzqmL9hAt
         Cdge4JAWw/O5VZH0LIwroh3taQDX8jhNXemHcx1XBL9YppmKH9C9sQXo9mvWpP205eBB
         C+kFmmEHcsuYXnCEsslQN7WdyrHXSRwrjb1xGNE13oTwpQjWxdqXMAPhlDyO5iSjf46L
         l4OV9G43MrWa+oKXkyLRzDgZiZVG0b+/ux7S8Io1JZYpiry0QiCSeBy9c9jla3v5QLVm
         hf4Ke3woaQXUgEZ35M0xqVmHMbxbA5/+Xr9kO6CM1euKzstjw/LLnq8DAzSDkRWHHRmI
         CjAw==
X-Forwarded-Encrypted: i=1; AJvYcCW4x8EVx3i7KetxybzHv5YzHnNeKkyC5erCVGw5uCY8MIxMAca4RQf44ozcXHiZhiMXFMsQBN8h5Dm/eHBVEpjtKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwaAHG3BaTi/0a1bPZSiM9/WoROGkqaVAbgdgIMS4xakPqtjTP
	X4e1ejibl0xaBm0F3I2Ltf70d65BYH37shkpsC5NuuKL2Mq14kepYFnhte0sFF3oLF8O7/ZzZX5
	UDHu5oHyqVvxfNTbB30eSTrSZ7MQelDVXIyDojQ==
X-Gm-Gg: ASbGncv26XO+kpqAb4DjhlxkB60bJXHQnWab92OvbpYPQR8gHka7KFFdzYNFxvMDAhM
	m/3buZXf3K4+jvnZxbHlPQbqv65uMtZKKLsOExqf4+q4b6A==
X-Google-Smtp-Source: AGHT+IEHe0hEqVxHW1W6LA/XnWI/0yeqMuF4kFnDKLb5IX3EJI4UID7Ltgg79MyMh35EoVOtfkZnRY3ZbH01erDTs/A=
X-Received: by 2002:a05:6902:2b07:b0:e39:8d52:e308 with SMTP id
 3f1490d57ef6-e39de228e92mr7181180276.26.1733398982302; Thu, 05 Dec 2024
 03:43:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
 <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com> <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
In-Reply-To: <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:42:51 +0200
Message-ID: <CAA8EJpqAjx+K2GdKt=gLxsETa7nvH57f3RVbhhL6EftiN_8EuA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: Liu Ying <victor.liu@nxp.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"tomm.merciai@gmail.com" <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 11:01, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/04/2024, Biju Das wrote:
> > Hi Liu Ying,
>
> Hi Biju,
>
> >
> >> -----Original Message-----
> >> From: Liu Ying <victor.liu@nxp.com>
> >> Sent: 04 December 2024 03:43
> >> Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
> >>
> >> On 12/04/2024, Dmitry Baryshkov wrote:
> >>> On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
> >>>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>>>
> >>>> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> >>>> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> >>>> format by selecting the LVDS input format based on the LVDS data
> >>>> mapping and thereby support both JEIDA and VESA input formats.
> >>>
> >>> For the patch itself,
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> A more generic question: is the bridge limited to 4 lanes or does it
> >>> support 3-lane or 5-lane configurations?
> >>
> >> According to ite,it6263.yaml, the bridge supports all the data mappings(jeida-{18,24,30} and vesa-
> >> {24,30}) listed in lvds-data-mapping.yaml.  lvds-data-mapping.yaml specifies the data lanes(3/4/5)
> >> used by each of the data mappings.  So, the bridge supports 3, 4 or 5 data lanes.
> >
> > In Renesas SMARC RZ/G3E LVDS add on board, only 4 LVDS Rx lanes connected. The 5th one is unconnected.
> > What is the situation in your board Liu Ying?
>
> The adapter cards I'm using to connect with i.MX8MP EVK have only 4
> LVDS data lanes routed out.

What about the bridge SoC. I don't understand why the driver gets
limited by a particular add-on card.

-- 
With best wishes
Dmitry

