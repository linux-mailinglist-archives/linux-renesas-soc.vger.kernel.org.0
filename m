Return-Path: <linux-renesas-soc+bounces-4151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B59CD890315
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 16:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50DA7B20E90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073B912F38B;
	Thu, 28 Mar 2024 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/D7P/5h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D8F12DDAB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Mar 2024 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639838; cv=none; b=EVfDDC7r+Zaamn+lfJmzBcg5uDNqetDZ8hx8MiIkrmw/uCwxzlqK92uxn5hecfuE2KIZjhHYaJpkd9V0hqQGJSZHnEdaqWmsMwhKkhpwwYJv51Nt5P4x2U3GnXw99BwE48MVQGJgyflJfeaCmuUl5bYv6IMsatQdJblGdpi3DK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639838; c=relaxed/simple;
	bh=AJkPYpqVXIqOHDFdN2DgUYBo6skekufES4vSiwcEimg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvUesc7YkmgyX6aoNcpaSIVyRQXkawup7nENFgzZCj5ac90TmJxwq0zJ8GE6d172C2wo319NyimbVx3YYUh8gG9Abafb9OA2MxHiuzw9XLlmY4KlDKwiCemEWJbpKP2nDY4ZL+QWbiRJSW5l8bbY2TCz81ZzgKse6wgBqLHIl6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o/D7P/5h; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so1143546276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Mar 2024 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711639836; x=1712244636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42XTArPCVRoqk8/TuiJ0HEh39m2hZmnV2g8qOyBW9mk=;
        b=o/D7P/5hhPwQJS2aJ8+Y41zrXtVM6k6GoNKX+hkDnlb3jwruzKnDiX4zHuIGDklxnX
         FKQ4Fbx6adnyiKUA76h/zIKF2LKvMjF4sw6BeDJrOdtMatL9MgPPCSQ3CwugYM2ra6p4
         EekY3MxrRTKmM4mJ0wm46vlW8P7//GqSDrEg60AMeHp7NRVsdfXRS/43fUQ/qgJ6F+Os
         XbsbhNClAxOBaLiKJ/yMlCfbC1jbbyOyu+Ltir4VWpP9Ns0LcPfHPa3iuMP+WGDDpjEe
         c/kckazQUjPlsMg0R0ls0KcX/LqF/6UFsdoTHZ0GebJrm+9huWStrUCc6J5P5RV31LMd
         /c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711639836; x=1712244636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42XTArPCVRoqk8/TuiJ0HEh39m2hZmnV2g8qOyBW9mk=;
        b=R5jksmfhoa2s82gNLCbsxlI2qCjD19fBt3hiBOrSVnl82TvOFHb3Ah919tSNnW4ntB
         SpeZIoccq+4AXUxgnDy2Jkfl9FNz0pqgxQsS+8dXJHxnu3uadigozMQV8jlxb9EP/Bck
         Rc0cceIgTfkBzulC3TPqmodh167NNPxRrbD1p1thBcG2iK3VLzSCI7Yd1R7wsExKnyI+
         XsRSIy/b+f06poW2iB1olGFxd99SFJxucJ8ZxSCGCSC8NkS7ErFLi1jr/wrL0bsisc55
         9ytb0GLe0jazgU4rwMrsSkXKO5Qy8/iolWy3eeY8ftFwZP+zHmAQ9HY4LANBDlPsczbu
         tQlg==
X-Forwarded-Encrypted: i=1; AJvYcCVOb6912nUL2Hz/GDGmzy7FhENFzlWB/N2EGQKw6WpaCE2nJkkwe/vBBwTMqanW9fgZFwv9OhnjYfPOEprIdCKsTY8TCz77QkmfmwQsF+reZIE=
X-Gm-Message-State: AOJu0Yz5zyZozpWEUC/KNoLpUBPMbP2ffYOjSvRNBGTGIHL5QhUh9W7E
	2nVYMVyb4szEknNkf0aHLZy60Nqh+LQA+FUDgFNClkJKf9o/ziKH+Xl/t76sFp28tACCAxuahrd
	COOp2AYyhNNVgC6uuItnGldpU8p2tk1S5eZxyhg==
X-Google-Smtp-Source: AGHT+IHOy04+KB2eQSludzmV/iMmHXENPkQ9EsYxYjMFJnHDlMoE1O/R/ES928QBtkxO0geLjDKAOYuxjhipP1bO0D8=
X-Received: by 2002:a25:108a:0:b0:dd0:c866:ec3a with SMTP id
 132-20020a25108a000000b00dd0c866ec3amr2916455ybq.22.1711639836282; Thu, 28
 Mar 2024 08:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+V-a8uEoyjjNCydK_Lr2CVOPN4j2oL2moVU8RgTravv3ygO9w@mail.gmail.com>
In-Reply-To: <CA+V-a8uEoyjjNCydK_Lr2CVOPN4j2oL2moVU8RgTravv3ygO9w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 16:30:24 +0100
Message-ID: <CACRpkdbWE7yQxxX1bv5JvSirJq1Dkq8_NDzVr9MaB7o+LZONPw@mail.gmail.com>
Subject: Re: [QUERY] RZ/V2H pinctrl implementation
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

mostly these are questions to Geert because he will have the main
interest in keeping the drivers coherent, but I'll pitch in!

On Mon, Mar 18, 2024 at 1:00=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> Option#1
> - Passing the power rail information from the PMIC to PFC (pinctrl
> driver) so that pinctrl driver can read the voltage level and set the
> values accordingly. Here we will be using the
> PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS to get/set values
> Pros:
>   =E2=80=A2 Debugfs can show the value in ohms
> Cons:
>   =E2=80=A2 Race condition at boot between pfc, i2c, and pmic

This is something drivers simply have to deal with using e.g. deferred
probe. Also, there has been extensive rework to make DT systems
resolve dependencies before probing so that providers are always
probed before consumers, have you looked into this?
There is also the component binding used by some drivers.

>   =E2=80=A2 Late time of probing

How is this a problem? Everything has to probe eventually.

>   =E2=80=A2 Impossible to validate dt-bindings correctly

Probably not impossible in theory if it parses and cross-examine stuff
but in practice maybe yes :) Ask the DT maintainers, they are
after all all about describing HW and if there is some HW they can't
describe they would be interested.

NB: describing the HW in the bindings have *nothing* to do with
the Linux implementation of the bindings so it is a separate
issue altogether.

>   =E2=80=A2 Manual doesn't say that pfc has access to the power rails, th=
is
> could be a challenge

Hm I don't get it.

> Option#2
> - Specify the voltage in the pinmux/pins child node alongside the
> output impedance (using power-source property)
> Pros:
>   =E2=80=A2 both driver and bindings can validate the settings

You should fix the bindings question first and then think about
the driver.

> Option#3
> - Have an IP specific compatible ("renesas,v2h-output-impedance") with
> value 1, 2, 4 or 6 (which indicates x1, x2, x4, x6 strength)

If you can get it by the DT bindings maintainers I guess it is an option.

Yours,
Linus Walleij

