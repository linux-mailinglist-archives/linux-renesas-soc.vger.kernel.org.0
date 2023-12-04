Return-Path: <linux-renesas-soc+bounces-651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270D8039E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 17:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1308CB20AF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 16:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2541D2D62F;
	Mon,  4 Dec 2023 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEZGu5Q3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CD5FD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 08:16:01 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6d9a1c13ea6so598742a34.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701706561; x=1702311361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3Rq26SmtNxjBHL+7sodH6Y3hH55K8uHLftxea/5aOE=;
        b=MEZGu5Q3khJEbOkNpg1YAx4YZo/JKbjdcTVDAl2kOJ+fMZGoYo2Y1IUNrRtwPxuIL6
         KEV8V5YFMd8WqZ7NP6mOOeGwf85x6JUq3+t23mWqtk6KZa5smCd8f14A3HGDp3ADS9Fu
         q7K6oTEy7vfpfRfq3CjkGitTOG8AijPsrwSL8q07yqk6fumklSH01/Zd4aG+DY16/3Ak
         j8F7ZnnZBwcJIsY0A9smQc7gyUVV5gPiBiC/jP6cNeHEvBlEn7K62eZP0JfeS40OSGUD
         kRnSBFSS9UnTvxw4pSa+EByg2zVsEuY0r0bz5McG98DiZz9/lTzmd/pIId0UJHLpI1Eu
         rJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701706561; x=1702311361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3Rq26SmtNxjBHL+7sodH6Y3hH55K8uHLftxea/5aOE=;
        b=axTuAuuL7ccrX9T/S+rYhIaE/0+hAfNnMDzPZzL6Fg4SZqYLw0XHZOE4xf+i/kvdHP
         vj8UJ46kihjw/lVdhFhyyJjRz4GljH/R8VOmtPbUWydIlcvPsJRoUK6CpwKnNR1shKsO
         QqxaTFagHwpWPZ6N3CS75NwCo4Q7WRfI57CQgh6WuHq9d8q1LM3kXPY1H+iDJJGw006k
         xkkZMB3GDt5Wkey/JmqpDIYFJXppvmeHeH15TCUuyhqC24nXVPvQ9L6Z9olQ8kJTyeWL
         2ha7bft/vN4s+6bLdKu+3BSrFDcFRBDy3NDfmwRuLmnzV99dRAfd8EwnEBA+ZKXZYty2
         GwTA==
X-Gm-Message-State: AOJu0YziVpoAdTZ3hJJ8l1Ey4OXiM6A0WtuCGF9ZtasQas6Z2tK9EPko
	vtZsldxw4lCng1eyNw474VfqPryEGsSnHIPEMfFnnvxQ
X-Google-Smtp-Source: AGHT+IHeMg3IqYv1oObxg/a3nddlTB0cG433u6nB+9rzQjWp1RCFYTc4EHF1sSTYAthQMD9Dil0L+gzurrYUA6JyMAM=
X-Received: by 2002:a05:6870:c152:b0:1fb:75a:778d with SMTP id
 g18-20020a056870c15200b001fb075a778dmr4120921oad.62.1701706560957; Mon, 04
 Dec 2023 08:16:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204090852.1650-1-tzimmermann@suse.de>
In-Reply-To: <20231204090852.1650-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 11:15:49 -0500
Message-ID: <CADnq5_PRqcugQHibGbhGb2LvnJ5uEtLFqOf=HQOf8_8zthgt2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] drm/plane-helpers: Minor clean ups
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, 
	airlied@gmail.com, suijingfeng@loongson.cn, dri-devel@lists.freedesktop.org, 
	javierm@redhat.com, amd-gfx@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 4:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Move drm_plane_helper_atomic_check() into udl, which is the only
> driver using it. Remove several unnecessary include statements for
> <drm/drm_plane_helper.h>.
>
> v2:
>         * fix documentation (Sui)
>
> Thomas Zimmermann (8):
>   drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
>   drm/amdgpu: Do not include <drm/drm_plane_helper.h>
>   drm/loongson: Do not include <drm/drm_plane_helper.h>
>   drm/shmobile: Do not include <drm/drm_plane_helper.h>
>   drm/solomon: Do not include <drm/drm_plane_helper.h>
>   drm/ofdrm: Do not include <drm/drm_plane_helper.h>
>   drm/simpledrm: Do not include <drm/drm_plane_helper.h>
>   drm/xlnx: Do not include <drm/drm_plane_helper.h>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
>  drivers/gpu/drm/drm_crtc_helper.c             |  7 ++--
>  drivers/gpu/drm/drm_plane_helper.c            | 32 -------------------
>  drivers/gpu/drm/loongson/lsdc_plane.c         |  1 -
>  .../drm/renesas/shmobile/shmob_drm_plane.c    |  1 -
>  drivers/gpu/drm/solomon/ssd130x.h             |  1 -
>  drivers/gpu/drm/tiny/ofdrm.c                  |  1 -
>  drivers/gpu/drm/tiny/simpledrm.c              |  1 -
>  drivers/gpu/drm/udl/udl_modeset.c             | 19 +++++++++--
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  1 -
>  include/drm/drm_plane_helper.h                |  2 --
>  11 files changed, 19 insertions(+), 48 deletions(-)
>
> --
> 2.43.0
>

