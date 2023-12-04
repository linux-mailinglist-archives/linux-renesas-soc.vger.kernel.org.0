Return-Path: <linux-renesas-soc+bounces-611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FA802EF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 10:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8420F2802A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 09:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5D11C6A6;
	Mon,  4 Dec 2023 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="haiWJzfH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B205B10F9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 01:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701682925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VaGns7gznEtfoHG5/ry6CysbEWdXBIzB19dd6KHGP/0=;
	b=haiWJzfH9lYDPxiwl3WlCBLs23LPQ3wdncQ3Vqgmlr0Y/1iIwoZG7ocWU5BIrZvPUsj9yI
	vUNeTKZNWMMKATt2Sx95jAyM7HA8EMfVOFEv3GLjZCCOe+5aWc4xhHAkYsUQud7xN0vVpT
	bV0kKuKDpwbmsEyBKtp/I+q8Wiydyxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-_pRqqbPfP1e4PH26geGcaQ-1; Mon, 04 Dec 2023 04:42:03 -0500
X-MC-Unique: _pRqqbPfP1e4PH26geGcaQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b3712ef28so31271665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 01:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682922; x=1702287722;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaGns7gznEtfoHG5/ry6CysbEWdXBIzB19dd6KHGP/0=;
        b=AhA9rUceUEv9TGKONP4jHRBVYZmNUdcCiLIFp8oV21TPs379C/pETJz0MdrlJZaKSz
         Ukhsla2tthpksGxm5P1C/gmDLckJsaApgCuT49JwBU6Yla3nxyM5TbNVJpSsCRU9tN7v
         37u9jWVhZSp05LsJTfgbFMACsE2yxJE92r6BQWtOEz/d9zcGMGg8guwyDxPz0ZX3/2h6
         +07Z5W9y6JS31aWxQbWzc0lujWAwUAhuX0KkuC7T8d2dJU3qQgrG3W5TZyVhakHoS0Ec
         gMkajE7rHBQ83h9/pp2zvDheheRXCM1H5pFq9Ezl6BsIYL5Rovj7KgHrC1OXgi53e1sY
         7M9w==
X-Gm-Message-State: AOJu0YzE/sOp8NiaQpokkG9yU4u1NUUxbBo10vO/Qj/y3A2C4uo1kfmc
	An3zb+ekn3SzBrncoFG463umHaMoanJxGTwrwnDZi9uRAKrkAMtzQWXxbHxuumXsVp1KYngVBya
	f2blxkf/yLHBISlRN/i94uwWjTGGlzUk=
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id 12-20020a05600c230c00b0040b5e21bde1mr1992490wmo.112.1701682922722;
        Mon, 04 Dec 2023 01:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKbDMlcSZRmYxfwIMqNYsq1c9B1PO0Imfj1CH1zWIpq+H+b1PJuusoLSRaiunDJaNEcQNA8g==
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id 12-20020a05600c230c00b0040b5e21bde1mr1992482wmo.112.1701682922357;
        Mon, 04 Dec 2023 01:42:02 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c1d9700b0040b3645a7c2sm18214724wms.40.2023.12.04.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:42:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 suijingfeng@loongson.cn
Cc: laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/8] drm/simpledrm: Do not include
 <drm/drm_plane_helper.h>
In-Reply-To: <20231204090852.1650-8-tzimmermann@suse.de>
References: <20231204090852.1650-1-tzimmermann@suse.de>
 <20231204090852.1650-8-tzimmermann@suse.de>
Date: Mon, 04 Dec 2023 10:42:01 +0100
Message-ID: <877cluxq1i.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


