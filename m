Return-Path: <linux-renesas-soc+bounces-23458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68884BFF879
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508A11A025B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 07:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D2B2F60BC;
	Thu, 23 Oct 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSjgc91f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99A2F5319
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203987; cv=none; b=GnvWqcldzffHnsduaktjealsSEG3mNrawfkj1DZp+xj9IYnws5F2vrErbpeAHCBXNFT6/38KT/SuVbpwPulEBrfdtKvL2t8BgUKxoUqtXrt/vYq77fmtB1nYBxrxXkUdDIxi09mZZMjG43/EFK2E8WWxlk0NVHZ54NUdPzaidIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203987; c=relaxed/simple;
	bh=eKKGOO+EUYU7mFuj7z5lwhNA8rPS+bCTcsDg6/XrPM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtydUNmWNij+IgTR7S+FbliPWAUsS6EEj7tsuLkhXHnSMmnGTeyW0iYRnvBg99AvDhMsWgHqO+NaqgBGosvLJPIfdz179uyGsu89z8Cg/PWTcg/j+rAUOLrO5oJhTNdeNwLlkw/5WTjxoFBjPmVGHlrWeKf2C8Dd2GW7y7cf8xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSjgc91f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117f92e32so3698975e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761203984; x=1761808784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKKGOO+EUYU7mFuj7z5lwhNA8rPS+bCTcsDg6/XrPM4=;
        b=BSjgc91fYRnfjP3+xsBySkpSzz9DZ1sMPXXH9X9a00asjdgtPR7K/hh+Cg2vaZhg27
         K9x8IYoIaV4CZUGZ3vkgebNOwUPr196exu/6EZ27zwPbRA8aMrvKXuUOYm0glikKkX3j
         bRkafoxKnnhJ8XoOfrhfFxs7Y+RLZOBXpIl4pc3JJld8q13x4j/9he7cjjz5Ui5JOWkV
         KN6sG25N+ohacgKEXaQgnSELyYW2RMbEvqSY6tW0IuF0TAF7OucvK1C/Mje5/CnnjGOq
         Z5c6dwdYlX44Zu1jEAoyWw1F3GTUac/rRPH96DrGvnIgqSyVAxkv+q3ZiLH3hmfBUsmb
         9Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203984; x=1761808784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKKGOO+EUYU7mFuj7z5lwhNA8rPS+bCTcsDg6/XrPM4=;
        b=d08UKUdKKwXErQtKbaxEGzuj9ntIvLcFlawihJwOniUyzdbtXdx9ovh5R4GAJXAVYP
         bWXBk8nvqflMj/ZdTR+vLQ0gzU/30T6DMvX3fUJO4DnIcJIIlgbdl+kQxhZiHqThvVLu
         Yd/tsR5bxkmLTxhRYL3nvhLNXVem/oFYetM7mQeahzCDaPF1siODPV4cs9vmvC3eWw8+
         gdB4wWQ49p5vHXMjjBgwLpxPdfWWiE2Fd9vKclEt2qL3y1gnG2Ys/MpYy34A5OyxGuy1
         orypFiOI6724dvifSksXzmF6GCOcKjgZet/P+yTPqDBrS1lPNobJPiHSOEqpDdJpxzpX
         uYNw==
X-Forwarded-Encrypted: i=1; AJvYcCVRZEd0cNzDsPvFMNkvUyWEQTBY3gHF6ZnVKvlVXvU7MI7b2L1VyZ9K8BG1DpR1OZNV6PlpCvY8OFwmt+6gQv08EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvekJwaahqEOOt4S/caAyCVPrlhbBCFPYdjIS0IcEGL81gHXlf
	rRq8nfmZd6Wl5cm2ISUWzyzsG6f5fFkkTwfZ6gb06eMpHU/1OYXfBJkS2UeFYfDERhdSF7VLyS3
	pfXNC2zWCZSrssK/6UDnTzDTsWeZDrc4=
X-Gm-Gg: ASbGncvKc0hv1tedg3gEx5Jhrj7kovQJuZiCGdoysp5T2h2he6KxxKrkY3WZsj1D4DE
	wLyZt8t7uYeqaoX8xKcqCznrsjXhQmr+Qj+16AIZrpImjTUIiqjyC04/j3LkHp9AwLj2/QZFe08
	QrWuc19ef0jZSLzuWjlXhio+vbJo85vxdG3+NXNlrHGMspIhTPBeeQbgjFLL99ICr1Z/huH9AYJ
	ReOIbQQzeEs+LzUV3y/TPF34jsudJJlQe9I6a9jIDi6CP3alnitcv3ihBLaT44Pjknj9YdI
X-Google-Smtp-Source: AGHT+IH/mkmYloWSl+N3GeTRYAq7ya3Ct20DnnSTnKTWUDECJMSJuulDknWTBXri6ZT9mQCzclYrezLV30aAJPqFoCY=
X-Received: by 2002:a05:6000:22c6:b0:3eb:5ff:cb2e with SMTP id
 ffacd0b85a97d-42704d945afmr16411155f8f.29.1761203983713; Thu, 23 Oct 2025
 00:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923115120.75685-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <2025102218-blinker-babbling-5fcb@gregkh>
In-Reply-To: <2025102218-blinker-babbling-5fcb@gregkh>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 23 Oct 2025 08:19:13 +0100
X-Gm-Features: AWmQ_bmLla7MkDZZGpNbPEINbL9Ov2BbNibp0fEZqdf2JnlACZ-DZdND2GSrAnI
Message-ID: <CA+V-a8tOqZ-1KKgkEtoMnFpYghY+8wpnyr2T6XZFvPY9zG2Byg@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Merge sh-sci.h into sh-sci.c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, Oct 22, 2025 at 11:03=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 23, 2025 at 12:51:20PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Inline the contents of sh-sci.h into sh-sci.c and remove the
> > header file. The header only contained register definitions
> > and macros used exclusively by the sh-sci driver, making the
> > separate header unnecessary.
> >
> > While at it, sort the includes in alphabetical order.
>
> That's two different things, should be two different patches :)
>
Ok, I will split them up and send a new version.

Cheers,
Prabhakar

