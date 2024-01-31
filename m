Return-Path: <linux-renesas-soc+bounces-2154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B213C8443ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 17:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4155B2AC76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 16:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFD412BF2A;
	Wed, 31 Jan 2024 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+Fb9TRk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB912BF0A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717778; cv=none; b=aELYU9c79aJSzciVknYcYJBF2pVpYLKCyg5vyeTjImygzYF+oTpl2T/W5OPPZu+s/Jxe42Wa9f6s/KdMyhQ9GruW0r1hE3sQvEPs6R2gYKo9S6DjBEwtEkDuClmz7FQQClHpOpKVdsKU0/B8Yd1DudMgJJxeCOBS8kQdqFWDNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717778; c=relaxed/simple;
	bh=ibwsPIor3wbGYQD/hLtasMF6cDDIw9FflDn5f05clPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DehBm+u/sx94UqxsFIOpl680ajA994PCX+O+ctFVsC3vhXopunaCRXN9Mf1VFn6kIBON9hihkWzWNaAmvXaI+QND0UIfk6aPbBKLoLMLfUsMqR8N8Hhd5eBax/MPvX3G0QdCDp3rtjdUSiRoG0FVUZDi+Hlb4wx+mrPVclY34F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+Fb9TRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706717775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
	b=F+Fb9TRkeM2I+5MBMcVNHyETGxWliGsq2vCHAsRZUqy5qiz2lyTFJDIMGWAAS3y8digScw
	qkHwOTZXz/BafFed5nmhRA/74kq+vFgqPVtjxOUe1abC+NaOm+IoYEHctLzvwUrYtD246l
	ZCxd23g3IDZdaRLajAUN+9pR9WMRqGM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-HXu2Adr3MyyGH5IRy1yJbw-1; Wed, 31 Jan 2024 11:16:12 -0500
X-MC-Unique: HXu2Adr3MyyGH5IRy1yJbw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40fb03d8a39so7342315e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717771; x=1707322571;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
        b=XiBx00trAdTC5+EMvnfr/QVedsD7bUeDvIuTEuPqIAknV4guoK74Krl0Ho/IbuGqhC
         eOWygWShArgcQUYmPVRikEkQJl1ssaeQg4yYU9MR4ZeryUoQ+j52WJTMw2mxsJAlb/2e
         jPiIxyd0+A+nZJnsRiXJpTvv0F7yqNpBPcsV0QGlnmJ/ZcoIkaZu0conG5LnyGdP/Z3T
         R7YfDN4x5v1RnzgOFX6fcBuvEXE5aV+jc3Rd9neOZIvQSAFRWfme5GA9nhGdGKoAv8zQ
         zqJ3nfUbCuneDdADfo7+3LhtUpeLCAlNPQD70p591h3k6AYDWNkdgsG8+XiZyP+Q2PSV
         ZrTQ==
X-Gm-Message-State: AOJu0YyPNHmbWWQ7/IxP6Kav3c57J9G5SO6/H1umKwLxbJxS3KjmrcoC
	z+LQIWnljKHKc+o5TCTPALvG3uNuYY77n2gO46Ki4RGhY8T1B6c60ntIDsNebxOMf2kDYp5fcr4
	hgciTRgtcr9VYVqE8qkB5gNeUYmUq7Ufd+d3gM+ASPtRzgKY1IMZoqaELDdNFDY6rKVBl
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id v13-20020a05600c470d00b0040ef656039fmr1666488wmo.6.1706717771196;
        Wed, 31 Jan 2024 08:16:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPXw3WDi2GZ1H+C0qsa/dAVaPD3o3y3lXbF7MCxjdMESWq9m8J99FGcFCWR0modxgMLsxfUA==
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id v13-20020a05600c470d00b0040ef656039fmr1666465wmo.6.1706717770812;
        Wed, 31 Jan 2024 08:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUoDac0RvNodMCJs3PaWqqtOE+9dEzyxDlMMZNkLN+9Z6E/nFbEkkxrIHwfc+hSWJaNnVK7xR3Ed0cbCzcSkOg4wsj64PDZBzGJ55TAIfdOQUqkLN7RXdt8LS5U2xv19hTM73ntChGiMk6enpZZ1799Gz8DaC8PIbxx5EGjzmWMMj3MWkjDnr4A5WCVoTdePcahln+DYWmWWFW6nyhu9pxhcWV/Frc73YIhpQ==
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c044600b0040faf410320sm1939660wmb.20.2024.01.31.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:16:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
Date: Wed, 31 Jan 2024 17:16:09 +0100
Message-ID: <87r0hxtr5i.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit f402f7a02af6956d is in staging-next (next-20240129 and later).
> ---

Makes senes to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


