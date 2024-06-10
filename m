Return-Path: <linux-renesas-soc+bounces-6001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D65902129
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84D88B20954
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75957502B1;
	Mon, 10 Jun 2024 12:03:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559ABA53;
	Mon, 10 Jun 2024 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021021; cv=none; b=UfqWdwy+fMWFu1z+NIigCRD3Es/GuwqfQIDAMQF4tnrNFVflBG+mM4bEdbSvt3HEc3mNuVJ4R5Sq6HJSoQIeu1NBONOAZFXfFyDqtVkvyH/qS+hAWcV0Sg+w0LoYS2RINJNRkL0iTEiOmw8v4/gEZEw4pNsWQH7QG3AQXMRgweo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021021; c=relaxed/simple;
	bh=ctBUqaam8iQNZErhA9WWZJlGDdiavoN30AxZewA8Y9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7H3YuN1Pv5P818OTPKsmtXXKDUHcA+D6RzZOiPVdmnrN90Yos/liCgKgSuhBtFtOut9xaWjU3SdFAq/8bJ9s2u9eZwC0WOo0KygAWyDeOtT8xl/Wft/A09ISIulDSFDOcMaAcQtpBfILMwCQxH+I4R3XzCDfa6gb9PxkpmOl/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df771b45e13so4258068276.2;
        Mon, 10 Jun 2024 05:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718021018; x=1718625818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuMtyLzsYwWi/omfJccKRsq2ATwslUW7nz8GjD0/Dlk=;
        b=WsNFFzF7sePXtksWbF8MkoNXO9WQsYKbfn5WPtE9lHqSVmRR3hid7fiKv0Ce6VHDYe
         9U0GayC3jrIShY6U2uG4kDkaaNPPJuoIHF7Vx31SGhkWDpyjNh9dEUCwmK0pGBgK99qA
         Zw+Fn/vDVpyymDkX6NRjWlGpK3kNdiFWx/5OpVULIfRRl+f51+9bHz21b6BitTqBM2Vb
         ds3Tw0Mx6A7rOuncJYQoKqioZJfvhkkRrvAI+wEg20s9zBEV/OAaHxBvWxNY7VvYNek1
         p+cXqgjzOg53R8x3nCr/irgDGmMvJ55VMtH8PxmdXyE32LrD2YAqf+HEw1derz+DwNix
         J3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUWnwSx6Bj1M7HlLzUwIcRV0iFxiVTrcfyYdcXvtdjBpD3xCA+TPo+RRIoEDAIFnQ4GwOw9ZLV54oxGLXClUrvK48Eqe5X7td3t/S3T
X-Gm-Message-State: AOJu0Yz4z2vf3ccdTVpQREM/FTREbupug5aGKt1sBmODzwmW3pUqZuZu
	G+XsQi3h4AXg/+kLt7G92e6AK0fog6brvJ8QDCgRd49AjNqI5PHcYpZkhCBn
X-Google-Smtp-Source: AGHT+IG2pO8qmWUwFzbhkyvO3sp+Cr38b9pbbbIL5vjheF9RfoI0QjoMpY8DvH9N6Ify4VBuuZyJcQ==
X-Received: by 2002:a25:ade6:0:b0:dfa:4a32:3c04 with SMTP id 3f1490d57ef6-dfb3f71c848mr819428276.23.1718021017264;
        Mon, 10 Jun 2024 05:03:37 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfb0bd09b1dsm931251276.41.2024.06.10.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 05:03:36 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a08099115so42409727b3.0;
        Mon, 10 Jun 2024 05:03:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoA0SQu9tJo9OoWYBX99fctZK6RsFkgcP/nIOBBIKYSdREZlqiPvhtVm/T3CY1imurnewTsloWCvW1ofGWDtO5zTrYg85FHeBlGgti
X-Received: by 2002:a05:690c:640d:b0:62c:f7ae:48e1 with SMTP id
 00721157ae682-62cf7ae4dabmr44787837b3.45.1718021016577; Mon, 10 Jun 2024
 05:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610114554.82496-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240610114554.82496-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 14:03:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOHHsyvZKME75qHk0M9sVf6A8EnA0YwJpbDSHt48tTVw@mail.gmail.com>
Message-ID: <CAMuHMdXOHHsyvZKME75qHk0M9sVf6A8EnA0YwJpbDSHt48tTVw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: really skip LONG_LINE_* when LONG_LINE is ignored
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Jun 10, 2024 at 1:46=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For this to happen, all types must be set to "show". So, AND is needed
> for the flags, not OR.
>
> Fixes: 47e0c88b37a5 ("checkpatch: categorize some long line length checks=
")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3858,7 +3858,7 @@ sub process {
>                         }
>
>                         if ($msg_type ne "" &&
> -                           (show_type("LONG_LINE") || show_type($msg_typ=
e))) {
> +                           (show_type("LONG_LINE") && show_type($msg_typ=
e))) {

I don't know if the change in logic is correct, but if it is, you
probably want to remove one set of parentheses:
A && (B && C) =3D> A && B && C

>                                 my $msg_level =3D \&WARN;
>                                 $msg_level =3D \&CHK if ($file);
>                                 &{$msg_level}($msg_type,

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

