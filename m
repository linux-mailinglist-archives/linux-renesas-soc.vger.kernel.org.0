Return-Path: <linux-renesas-soc+bounces-24060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF48C30408
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 10:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB19188C3D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 09:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12389223DDA;
	Tue,  4 Nov 2025 09:19:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684E31E0FF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247982; cv=none; b=c2jgkDAhR5YKswkX9wT3jc0dw+5yBntn0n5RztyY6HEIciK98F2swjX1X0OpqgyQ/j9sNAcnifK+AXsOBGd3UVbpXldMfSlokamBRnsy2IJ+q0AN2FVa0lRZ03CS/OkHZNPN1I4e9flafAtZMm2UogX6jQdwXt2Wd439Y7vf2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247982; c=relaxed/simple;
	bh=HU5OQOFVith8pNfDFYvJqOTzkqv6yvLsvqAc7VZiXKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYkFRVOByLYooxk3XXYt6pPXH+YmDN6nwhNG7zQtxfGPkvWweWAiebevBn5A5oWzT2/gweK7dj2Le8NEjLwYicDVh2bqDag74lGwU/0Ewdsm8gnN3Kh5qmQj+y4fJcms7sQWvCmptL/ZMY2K/jDEKjqLZpXdhlXoHki/q3cJAzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-653652a4256so2507472eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247979; x=1762852779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Rhdb+Q/JnShH/beTKgwAN0mc3vq4HcuoW0J6c97au4=;
        b=CHM2g0rltUeUZdzkKj9YVtCsx1SQmz7QQKkU9f5VtcF6ixDisb8n4YR5MTu/ecEvEF
         bzYd0FdDMzHN9kiTicngLH1/d6jaxCtRZ6w0ylZBJeRfZLi3/b6/c4bAqVKMSZcCvfOA
         sntIGoImfILmfRj81truruLUpB1GM0t1CechFWXkWPbYBJFAdMjt6pegYFvDafr9kLsF
         mhZNXkXgB0Roofbo7Py+rqNqv8zPTyB1ShyCVvfGs0kpv3XtLJnxZQCb+tEULwv2HTG0
         KJSzmwKgWCxykKfLcMSzlcbXdXMdLaglIsJTGAjHx8ZmzzIgCujDlI1pDDPmrp0Pkr3y
         YYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVETNkm7NGG46J015bMuz78AVFtJCfLB6avz4h/gTgIGbb5SGpr+S9BLikKoSZs3Dz5ktLJu9Riep5gZW48cVH6Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzOuBYVNEyFh1GGl+CGVt7EujeZun5fzU6Z9aM44mdiKUSPQA
	qrzKljlBuKYiEqw2EeF20dbSUxgYRGft83yiAynYU4HpZkB+d819Jy+2vQNriS5G
X-Gm-Gg: ASbGncvH/V14xMcp47WpJrWo8ljtZpMxL9d+P6fuqmv9V6bYbkLcAyGEk52ZwfM6TlX
	THj8xOltM8I4+QDFPioOmFYnEZn71SlNSqcD4KwHhqJLM7ccSIr/AmZkhJyym1fnVmOL2YQjRRI
	DYcoGbNUp4j3WLo0rLjxjfXz+hPCYT7sMRt+Zx8F8y7xYd6QIdUNKo91O7/iTvMH7l5WKYQZTyg
	PRPMGVYtuY4mCruowzmC+pDlS1ee21jaWVWs09M3ptRzAW5M6fksVY5rNNCG2w634LIqWABlsnh
	xx4n18efeBr0MOUxnvcF1vl4Lvr8nejUJCD0USbk2YeRxUJdtC//zgMZazXTLazGgbEGaPHq7H5
	hn4VfFksTJSr85lv5245akkAQuTVAntl1KenPDcmdDCNZyyWaUaMteXt6uyg+Yqbx1S6i3RCYiE
	D+zJO7IEpULkThYP/MxPC43cFXTQ8h0lRiuB69QS5SJpp46qTNLwlRCEItcDU=
X-Google-Smtp-Source: AGHT+IHpVc9VMsnGYwd8s5r5/hacyqmtVvs4+5S6Pth2N115afBzRJLd60/P7mX8HPaaUygo+tWQ1Q==
X-Received: by 2002:a05:6820:1846:b0:650:73:b922 with SMTP id 006d021491bc7-6568a6941dfmr7148687eaf.6.1762247979159;
        Tue, 04 Nov 2025 01:19:39 -0800 (PST)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-656ad0617c8sm775632eaf.4.2025.11.04.01.19.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:19:38 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3d2ea93836bso3061903fac.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:19:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb1vBSEd0podiK4RPaFrkebYOG4YBuAX8bSBsauxp+4VjpxiEMNbr49aNMm/EgjaJvdgCnSY4eAqwkyQk0rZUvQg==@vger.kernel.org
X-Received: by 2002:a05:6102:c03:b0:5db:f424:5b9f with SMTP id
 ada2fe7eead31-5dbf42466b1mr1343933137.25.1762247655617; Tue, 04 Nov 2025
 01:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:14:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX29=a2RWEp2-s9VqAdOt==wA8+Nm7ZrgKNpKzE1G7wHg@mail.gmail.com>
X-Gm-Features: AWmQ_bkAARguUxuCuAtORfzfuH5zx7dwTjZKFID94CY-bRv0DDhFBhuCd2nuPuw
Message-ID: <CAMuHMdX29=a2RWEp2-s9VqAdOt==wA8+Nm7ZrgKNpKzE1G7wHg@mail.gmail.com>
Subject: Re: [PATCH] drm/display: bridge_connector: Assign bridge_connector->bridge_hdmi_cec
 before drmm_connector_hdmi_cec_register()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 3 Nov 2025 at 21:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Set valid bridge_connector->bridge_hdmi_cec pointer before calling
> possibly calling drmm_connector_hdmi_cec_register(), because
> drmm_connector_hdmi_cec_register() directory calls
> drm_bridge_connector_hdmi_cec_funcs .init callback,
> which does access and use bridge_connector->bridge_hdmi_cec
> and expects a valid pointer there.
>
> Without this fix, on Renesas R-Car E3 R8A77990 , the system
> crashes on NULL pointer dereference.

Thanks for your patch!

See "[PATCH v2 0/3] drm/display: bridge_connector:
get/put the stored bridges: fix NULL pointer regression"
(https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/)
I even took it into renesas-drivers-2025-10-28-v6.18-rc3 when I ran into it ;-)

> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored bridges")

Following the Link:-tag in that commit would have found the posted fix...
But I agree it is problematic that the fix is still not in linux-next, almost
3 weeks after the first bug report.

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

