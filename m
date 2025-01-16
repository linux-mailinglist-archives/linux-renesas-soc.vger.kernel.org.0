Return-Path: <linux-renesas-soc+bounces-12193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF9A137A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 11:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FFBC16459C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 10:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77991D5ADD;
	Thu, 16 Jan 2025 10:18:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744024A7C0;
	Thu, 16 Jan 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022687; cv=none; b=a2RA29hQhSyfwGc20p9D7jJRUl7lA/C60pTMsAEXBixXt3vCiYzQjKslyvBaHFjQ9moNv0fp3RMBglUTzQUnNzQMS0p9Zf2rXGalqCralEHQtsy1IyQ2MOonoDJyBiBdp1iXsvnUp7YCoH2Wkz0VC4yXNL52mmbjebXvlaKdGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022687; c=relaxed/simple;
	bh=rJpvjIZksFaKdWjT6y12akmGRzmmZZ9pUlSe5otTscY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT+9mgeV0IwlFTSI/I1tu3q2XNc+zGLwO88Bb6aC/iHEfKTWCUttG+YaMZN9kzrjfXelqc20FhZHjy4SdKvu8k94UUuNNZt/9xpw8jI3tBrpxixnML+CF0FafLaPiggx8HMJutcxPmH6tQiesLd5pZEexbQwO7HH8KOf1EwoDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afefc876c6so133645137.2;
        Thu, 16 Jan 2025 02:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022682; x=1737627482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEBC4YtYCJgyImQmIlExzdfeh9O+mJTPH+y0EtpZi1E=;
        b=ucCvBZIN/0voJLOiXlSc/COIWc9dwSsAZ2yU8pF9n7W4Upp3FekCkA4BcbikiCliHB
         g/tLtqY20Q6PL6oc96qid2Qvp6VdkhuraXvZsH23scg+BNtnxdh5Ri7jATiwQ/M3z0T5
         DOaeiFnLUnu05fxNASQ74d6jnjiiRbMFV3y8k7mbG8dkdXQqp/tK/wTxd2RA/L42Fdly
         Njzow9DHNUipSx1hrWQbVp41aXmJvMTRkVDZBjUnJ3RbDf/vUdd4+ihTFCDr0k/Sw5jA
         AhD/ZkPFlh8eMqCnrMyfQ2cIDP6nNlbnzxdxQ/B09CNIfRoRcQe2O65cOOZuNWv9r1I9
         MW/A==
X-Forwarded-Encrypted: i=1; AJvYcCVYTLocbU27NVRxv+wwAtZQvDcXlmYWIt/znFUkdjURJ6+xLbUMMEa0oO0kqqmOA2ykYC26Q5aiUunXazMq+acjFaM=@vger.kernel.org, AJvYcCVm0i5ElqJjwMoMCCBDyztXRs11XANGGVzXIDsprRK3sebot5/kS57Oa/xgBI/+/DZrRSUHUrNCgf9dVRr0@vger.kernel.org, AJvYcCX772G3KCnJPp4onuce2/SAdXSlWEIpGcr7KiYLgofDoh5jASMiaStkoJDgl/5t5C35wwi7mQlGYDbnDsw=@vger.kernel.org, AJvYcCXdTnLC7z3wSGA0yP5nX7HzNNpFdFlfEFLowbaSMw00B/P7Vjg8WvX82mNewd0W7uJaeOtqWH1GuKRT6RF57nDwokw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6QsC5uqwgZ4UPEQsnxFTLkpLfDBxHPP66o90fFoX+eAR0ORF
	EzUahYIIGa4Edplxw3uG0872mK7qGsn2LhNSLGathqkdTiwU5EOgVnlMYK9DDog=
X-Gm-Gg: ASbGncuB3WPRPz0+B8AcskQIxWctXQ/NM2oJDe/0DIvu5YnZEzpv2sDnNIpP9CIP3JN
	7fV5uWbNSBIki0gSX7h7N5WkwtJ9yHYsc93uAFU93KIS75lmWDiIGP94iB/ssaVsre/a1Fri6fF
	ZdrgLcLB4x3RcNG2FdX4olI7EXbL3jcqnkUygjZa4VsISeahlFCxNcqUhOQYMvtCjYhR+UbLeEA
	awdgBtPoIy/oWJW9aOMki8f+B4W6QeoEe1pc68Fu5dRkMxzoNXOB83zu+v0P2QNwGWwskHcBAh3
	QIHSTwVRQr6psZ3VBgU=
X-Google-Smtp-Source: AGHT+IEfouR4J25gEmtzpoZUjCQwpOn6tOMayjKfcblbxctDbw6WLfaDhhgA59dEHkf6U4r5EGE9+w==
X-Received: by 2002:a05:6102:3591:b0:4af:98c6:bc97 with SMTP id ada2fe7eead31-4b3d0e60973mr30345646137.19.1737022682605;
        Thu, 16 Jan 2025 02:18:02 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623138542csm6252183241.16.2025.01.16.02.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 02:18:02 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afe70b41a8so138782137.3;
        Thu, 16 Jan 2025 02:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIRR34smkLzkFhtGjQxbhOuM/z5gLVqX8gKs2JzzUXXYuWZI/DSEN7Ew9JD/fqcTutaS9qTm2POSqGJkOgqb4gjIs=@vger.kernel.org, AJvYcCVWpSZzTwTaQKSYDK+PVaK+KDCAokK6EyyQvjK0Qk00vuFj11eI02vzbLy/IWRJ28HKG/kUmEAwa3W+4rJw1CyXYgY=@vger.kernel.org, AJvYcCX0x7x3+yBe9neWCjxiwMpSNoE43y0rH9MSNpjeT5KExeNTqcGf6JN4twOLTKyBAl1tO2dSYlaiadX6hQo=@vger.kernel.org, AJvYcCXRf6pYQUc/Dvbx/KTU0aGntXQ9YHHzgV+zz7u/m8QwPaEfmLa8lKkeeywRo8bOw1zo0gYRr+V4+9sUjPIn@vger.kernel.org
X-Received: by 2002:a05:6102:3a14:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b3d0dc0215mr29032050137.16.1737022681773; Thu, 16 Jan 2025
 02:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com> <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
In-Reply-To: <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jan 2025 11:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
X-Gm-Features: AbW1kvbCtGVmgNJ1oRyFqRTMVO1bCUCk0WwRoRvrPqq521tQuGLKMDrWmAM4CG4
Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>, 
	Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > [...]
> >>
> >> My point is that we have the current UAPI, and we have userspace using
> >> it, but we don't have clear rules what the ioctl does with specific
> >> parameters, and we don't document how it has to be used.
> >>
> >> Perhaps the situation is bad, and all we can really say is that
> >> CREATE_DUMB only works for use with simple RGB formats, and the
> >> behavior for all other formats is platform specific. But I think even
> >> that would be valuable in the UAPI docs.
> >
> > To be honest, I would not want to specify behavior for anything but the
> > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > documentation as-is. Anyone stretching the UAPI beyond RGB is on their =
own.
> >
> >> Thinking about this, I wonder if this change is good for omapdrm or
> >> xilinx (probably other platforms too that support non-simple non-RGB
> >> formats via dumb buffers): without this patch, in both drivers, the
> >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> >> and that's it.
> >>
> >> With this patch we end up using drm_driver_color_mode_format(), and
> >> aligning buffers according to RGB formats figured out via heuristics.
> >> It does happen to work, for the formats I tested, but it sounds like
> >> something that might easily not work, as it's doing adjustments based
> >> on wrong format.
> >>
> >> Should we have another version of drm_mode_size_dumb() which just
> >> calculates using the bpp, without the drm_driver_color_mode_format()
> >> path? Or does the drm_driver_color_mode_format() path provide some
> >> value for the drivers that do not currently do anything similar?
> >
> > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > sense. It aligns dumb buffers and video=3D, provides error checking, an=
d
> > overall harmonizes code. The fallback is only required because of the
> > existing odd cases that already bend the UAPI's rules.
>
> I have to disagree here.
>
> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> buffers are the only buffers you can get from the DRM driver. The dumb
> buffers have been used to allocate linear and multiplanar YUV buffers
> for a very long time on those platforms.
>
> I tried to look around, but I did not find any mentions that CREATE_DUMB
> should only be used for RGB buffers. Is anyone outside the core
> developers even aware of it?
>
> If we don't use dumb buffers there, where do we get the buffers? Maybe
> from a v4l2 device or from a gpu device, but often you don't have those.
> DMA_HEAP is there, of course.

Why can't there be a variant that takes a proper fourcc format instead of
an imprecise bpp value?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

