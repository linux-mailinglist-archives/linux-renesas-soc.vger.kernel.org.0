Return-Path: <linux-renesas-soc+bounces-30960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAOFEusE1mnbAQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:34:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D726D3B8566
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 09:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9ED153030B9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 07:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC036F419;
	Wed,  8 Apr 2026 07:29:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865B381AF8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633373; cv=none; b=CxnKodLYGqgcQtu3xEVnHV0Ke1R8x2S+SRzutsby2TH/78ssiMDXrn/l0DeXLTIiASdcfVIYQDSigmQTZIXPpQ7EuRElt3j47seiHw5f+KhqacYTj4L2nIhTkJoUzzqxjGq3Z4PE2Z8noQba+tVuXsR69mldjbErTI/3hDfJNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633373; c=relaxed/simple;
	bh=6k/It8c24tnKVHCqviqQIF0MSGkQ+8cQraDKJoGyNW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSu//WIsUxItOCcIBtv16z4d9W9QgvH/6QKG6ReZC99guwIWK4lAJ+Fwm9P7pyUWv2QXHKL3KTYgaMw6X+5ttwfzAK9tH7qhU7piX3pPa8V/zhjImC95xo4twuFkBSiMmPcF6dgSn/7inb0omV2OJggvZbmXmtGZJltWQeI5bH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60579b9c0ccso4911701137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 00:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633370; x=1776238170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ozK8AWnxAFkcwchuPJvYs/MG6e2got2QyqD+xaPhXw=;
        b=FRPSvTEzf/zfyNz4siH2/C8on2y/d8cPvJjGoPysMu9VrKjrExc2Utb5BGl7pHR23u
         6iCq8M9OFKhnx/DDvxzpD7dusRRLCp/7Wr/wP8gUuDNz2N6VhL+0Gk+tfQfbev1HMjFh
         Day8LSiZQccEKwoCfuy1x/kbsPvqaJ45f9SqVP5GzhjNI3C9DvValfLlTv404uGQ68nz
         PMxUCUlaVkkNQqqs4MBHn27BRvYDoY9jtsuZPcRqzKklX+3FrLokDNprFr/MLh6XM36P
         JLdFNrl2W+0cNFCEjlc622gnSVDJpcoP+1DgZuT5qV+k61RXO/McNWWsSmbg0GHcLiRq
         p8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6CxPkIJCLzbjCq3OWISJUqyXm8Dj5gLHtb8bowvsShaXsYsGcoFFyuL4VQcDHt7ZIIw+WN6iDHX9O5AMPW7ZReQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cUm5nM84DzwFoDlA13Y3CG7DOVkzgDgB2TB4DISb36zhpUT5
	v90Lya62uAFgVNs/NwSObHcAvwl1i7JIn5l+2A0l8plzz3Gq52U0qYJPRAH0Vkzn
X-Gm-Gg: AeBDieu5/+9ly/Ug1XNqw6gFa57M3BC5iNsGs2Scx0Sr4zcVMeep5pSLEUuD9IbDJN4
	Nl3onua9/EDjoffYdf2M4tWIBh0533pxTU77gasSeiWTr7GeLXyJU5HznUVuiDseA0VyGrlQp8Q
	PPCjtx+qgc2dDv36RFuC2HY1mmNkQ7laXbchNxPPFh/rt33ZeB9KPaItKP9Jl7mfyGcMuyrEk1y
	K0gj49pY9HpwG5OoFIJa+oY3gzwtdyGEgSHcLFM3Vm6L/ocG1cnonRYjVrVarejzymW33XJJ++a
	7z7niz8KqIZaxqdP+mXV3pJXv9W6Hoye0+RQ/VqoDPf9pOTrd3PxqqRMLey9qleaJNR7fY3HpY0
	hgzOlgKFUrkY5hd/wwf6C7IT1I5n9A3m/wC1062C9VmmYGDC2XiyMjoM4h2r1nLI4q2CmiTSHRF
	No1psjDbUtxTsHgCNbz05vmqJ3hhxmSIHXcDHymcwa57q7/+WdQIWM5LFPZ9o2/DOG
X-Received: by 2002:a05:6102:801a:b0:600:106f:5fa8 with SMTP id ada2fe7eead31-605a4e0b2f6mr8186420137.15.1775633370398;
        Wed, 08 Apr 2026 00:29:30 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e730e9sm20126918137.6.2026.04.08.00.29.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:29:30 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso6184222e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 00:29:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv3iZ9A8PS6qPXBgkzjFPwXBBGZ4qGZUV2u4fnRySIUYx3Su1M+lk1llWyszFyG901p+A4wgW1D8juwqMeGP7m7w==@vger.kernel.org
X-Received: by 2002:a05:6122:8287:b0:56c:da22:6919 with SMTP id
 71dfb90a1353d-56dab9a2a3fmr8411767e0c.10.1775633370031; Wed, 08 Apr 2026
 00:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260323164526.2292491-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com> <20260407225532.GC1214579@killaraus.ideasonboard.com>
In-Reply-To: <20260407225532.GC1214579@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 09:29:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrYXvNNsMfyT+koG5b4RB=Ziu9+_kkqZGbe-y_j5w7Ng@mail.gmail.com>
X-Gm-Features: AQROBzCb_gr7zhd8JwKJc0p9V1HTJzZSLBC6fwmRXCulxQtb0CbDQWPMLx6g3uY
Message-ID: <CAMuHMdVrYXvNNsMfyT+koG5b4RB=Ziu9+_kkqZGbe-y_j5w7Ng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Don't leak device_link to CMM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30960-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: D726D3B8566
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Wed, 8 Apr 2026 at 00:55, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Apr 07, 2026 at 11:10:52AM +0200, Geert Uytterhoeven wrote:
> > On Mon, 23 Mar 2026 at 18:22, Laurent Pinchart wrote:
> > > The DU driver creates device_link instances between the DU and CMMs, but
> > > never deletes them. Fix it by introducing a rcar_du_cmm structure to
> > > group the CMM device and device_link, and deleting the links at cleanup
> > > time.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch, which is now commit 3bce3fdd1ff2ba24 ("drm:
> > rcar-du: Don't leak device_link to CMM") in drm-misc/for-linux-next.
> >
> > This causes koelsch to hang during boot when a display is already
> > connected before boot:
> >
> >       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> >       rcar-du feb00000.display: [drm] Device feb00000.display probed
> >
> > When no display is connected, the system boots fine.
> >
> > While looking into this, I noticed that hotplug after boot crashes,
> > but I haven't bisected that. It definitely worked a few months ago:
>
> Oops. Would you be able to test the following patch ?
>
> commit 6c66826668e73570ce7668069460538f1ab610f7
> Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Date:   Wed Apr 8 01:49:40 2026 +0300
>
>     drm: rcar-du: Fix crash when no CMM is available
>
>     Commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
>     refactored CMM handling, and introduced an incorrect test for CMM
>     availability. When no CMM is present, the rcrtc->cmm field is NULL,
>     testing rcrtc->cmm->dev causes a NULL pointer dereference. This slipped
>     through testing as all tests were run with the CMM present.
>
>     Fix this issue by correctly testing for rcrtc->cmm.
>
>     Fixes: 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
>     Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>     Closes: https://lore.kernel.org/dri-devel/CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com
>     Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you, that fixes both issues.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

