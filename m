Return-Path: <linux-renesas-soc+bounces-19853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAADB1833A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 16:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC14A4E264A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 14:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AA6266B64;
	Fri,  1 Aug 2025 14:06:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B69624E4A1;
	Fri,  1 Aug 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057199; cv=none; b=BU54C9A18xCHFU5MT78ddZ9DSMlkgdSIqQt6wAwqfBKKJh2gJzW/SnGtwl7AB24RqwcMlf4gt1A0RweLpWm6emkE4FhsvU8rHT5A5HXCI3hhTdBe29jZPINrpIGnkrMVOpeYlsSV+Qq81K/f3GkTnxQ1iDsh1hiwNdTux5jwz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057199; c=relaxed/simple;
	bh=JVjh088GbZkgeQCGYnvdmMadS5kb0EtLD2DPUzlpw1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7SdYC9U6UCcqxPxCtOqiiPFSfMBXWxbqGEqfSSfKlCdSrItCKXNR/nLVNDPyK54Vh4gJICnxMG5otryGbvQRp5OTwCwDHYmgDTsXOfenonEsrN6mwx+y4c0jHLZ0KvpBGda16jqpAivnWDxk34DGyl5aeM88A7LT4rW2kfqJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aef575ad59eso241727766b.2;
        Fri, 01 Aug 2025 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057194; x=1754661994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0A5xi+3xpovbOffaEI0YAyQFVVclpkd8BxIERvxAbg=;
        b=Y3/LRQ9XEtsUG/iVNx7SBwFSP3PjIV15mDwLenLxEy24mXfxpIJ/XrxFkKjjNlVDST
         zCZyisraTGlXDYDXmSl2JjUaHMEdny5Q+wGUbjx8w8BzCrK8GLWZcW0zjcrTjNkdDJ9t
         G51/kKayEHhHJXZKlGy73xkDWmZ0AJNZZKWVX3pohb3fR7s2jyPGwg/al8zvMf3A6XQL
         iSzsLGH7X/tVHb6nixaiDlB0oLg6EkDhca2ee1lX2e3uSryP3ZhltfO4Q8JQaRt4k9Eo
         1Ebv+XCtFXlbmWodlBFsce5VQBlL7IOl/p3u3I2yPq4SUaPjNa5Cfr3GMGrh2YWNpBbW
         VSOA==
X-Forwarded-Encrypted: i=1; AJvYcCUvyp/WaLqAJS1iQeVSkYhO5NAepq4KqzSHXxe0DhaeIvNVlBqP2g4DLljWPtMInyV6QEFsD5NNjTvS4NrrJWTyAnA=@vger.kernel.org, AJvYcCXPnbyNb7t2M0oTr3xCZ65hgjzGUjJVYQFpeizbR/M9H7CoJoL2M4TcmgZKQB0Fe/C1IsYwHP2Puv+V1P4w@vger.kernel.org, AJvYcCXjZzjO4wFIVtmfPT/h4EwDJMApXNGN/qXvUNcLW06kGOFjofVJMDWYENbT/AnvIvkGotYyVXah8bE/1dxs@vger.kernel.org
X-Gm-Message-State: AOJu0YxExsorOJ+fGPQ+12pe86WUrcGlxt7NuEA9DfNNXLNnyBig9cGn
	a4iVKYP7i//CYzC27d5kUdhOXD33GOcu62ia/eZGmAL4YKFlblkqZ3pTIuvPJsMzeOk=
X-Gm-Gg: ASbGncvR96JUeFd8izByKptuutfcnvq0JwMM0mxsWIeinGBNEhVrp2uSw+kup/7Fyz+
	pt5Ebu1JppsgKexRTpcHDTzVVTzVVZQURkpfSdnXrBKUvEc4WPq21iHCEbJk08T/mIP9KqQBG9m
	uTOs4X2aUQ3GBbE3YNaXmJTYFaKxnddTWP1zHi1yFWDX2zNLAYY8UI8cbyFcHHIYTh4z9zX16dy
	YSDzKyJzhVK6UZsb7c0ruf1ha/sGMqI9Mya11lRTHLEFTaBPfZKTStOd9iNC43IWjvqFWLP+Znm
	Yd/taS25KkUpQIU0ICabmLxiqowJTLlaB+xi4tHn2mcTEvH5ipH4L17tRj6dc/eTduyQZYllCCG
	CDWhMeasVLfcJdbFFPOTFLQMosDQ2PvhqUE+IQoZH8f86lLIdNJv336Fcwm3J
X-Google-Smtp-Source: AGHT+IHP7zFEdhAPBa2Gx28HS0QL0CKiAJZx7eih9gPti0EgNpBkx6FNpTRXxzW+WYOWdVKoxMZaUg==
X-Received: by 2002:a17:906:1d51:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-af9319599b2mr278794866b.53.1754057193492;
        Fri, 01 Aug 2025 07:06:33 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm182429166b.79.2025.08.01.07.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:06:32 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so2146182a12.1;
        Fri, 01 Aug 2025 07:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJpbqK1HuHB7MPiJqswvqc3kXv7ETDTAIGpMBy6+N9kPWRG3oWSC4JxHmz20deKaQ1Qda6nXphUubXII6Y@vger.kernel.org, AJvYcCWrwjAO8OHGvoy/ylNASzt1EWWZO9tb1Z5RDSx8D1XaM85mRgAjbtWAJqT5hQ3NCnais5zUL6zhsLCkftBt3vNrbjo=@vger.kernel.org, AJvYcCX7EXUU7bN+T3Ya/CmRGBxiliw9HAgUTaiTLlke1iSI7nvHEchb4nuRlIX7yhJQ7Wqr+QKdJPt0YqAYUxI+@vger.kernel.org
X-Received: by 2002:a17:906:dc8c:b0:ae2:9291:9226 with SMTP id
 a640c23a62f3a-af931992ab9mr376411666b.59.1754057191885; Fri, 01 Aug 2025
 07:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com> <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Aug 2025 16:06:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUamdfu4VH8H9oyA_uhF8Jx8zDi2jfPmiy_-r2u-LU23g@mail.gmail.com>
X-Gm-Features: Ac12FXyqNVzOuQuexYljmDDN0_xmYa1ngs423zaCF76oVKZNARv5QvM4zwy2PHA
Message-ID: <CAMuHMdUamdfu4VH8H9oyA_uhF8Jx8zDi2jfPmiy_-r2u-LU23g@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

s@msm/dpu@renesas/r-car@ in the Subject.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

