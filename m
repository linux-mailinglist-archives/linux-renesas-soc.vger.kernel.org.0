Return-Path: <linux-renesas-soc+bounces-21223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F6B40C4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 19:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC241896818
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B9D34573D;
	Tue,  2 Sep 2025 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="052kC5kU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2BC21B9F5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834921; cv=none; b=IDozSI7e2xaLLxoWJrEnUzH65wApu/7lA9UQhaDaGLLlWvUIyaXTu4crDoUD7UJaKPdFBLTIwwzif9WXVK6jY5Wari90EJrnx3lyKZI2GIqi7bReplP6tRJAKb2lXaCY9gsU63crxftaHE7QQ10YseAvZ9xUOzKkDuo6q9nhyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834921; c=relaxed/simple;
	bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWz0qFDReJk4O6kvHn2VlwkaqVYV0eImEPGOMlo1FRVQp+evFbUM1WEfnoj8fzQ19NzL43C6b9A9/8IlXrMDiYXszt5Ci3xJKvog4IeIGpeiWhshhirGWUODv8iFPkf02MHaujJ47UXo2bitJ9JH2tT/NsgiMeSpo4yqlCufzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=052kC5kU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso2560169e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756834918; x=1757439718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=052kC5kUrN2lLVVfPRcbxYKEvakX+9A7x5MhmKE0Sz4C2+uxx/jOoim6DZIaHQKMPa
         GDhtrl9dcFVs2lFsgyiQjtkd4kWLa+6WSAuYDQsio8916UO4NufV8PSWtwEJ51+Hdnbj
         3JhkLhMfCXXgxHB4oInFKhJrj++PmB4AV+7DG4z5K1gPaMP8fY80gfK9nfh9cXGU+AVt
         KKEEkuMiGE9OJpwCucHwtfwNRXTKx+ajjAoS8K2zzgar0WltDFY2AwoTvVg+9UFNzy7w
         HawcpobEx2ZR9nvorl9w92hMY5uxtwzxDeb+Omby/7oUXO5VS5pnht7wpxzaJFTDjeVG
         vT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834918; x=1757439718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=YOPQWFm99zz4rUTIbOlFiSJTFB+yxC9P+8KATAoQjDqR86HaJbHX6ek6OOyTougdQ5
         558QQH/Q5W3uLk9AyxdkUx4iPY3WS3gLfrbBhkh9a/h6vQnqRx8oOKky0KJX8C8G+i9w
         x5qq6ZFtO1/HoqK4SWl/72APNq8nlGl3E0RyKeFDnZc6yD5oi2cNRvj7c5Y6yw/qwKcc
         Gjf/TP1R1vSKVmiXc3ohItCbo2AKGZxW32MMJh3DgSHISU2ugJFCU0d1cLV/hNq3GU9C
         Xkwk3pReXlDPH3Y0ImRB27B5IdK0VdsBIVfKZZo5hak2bIwf8f/fkZt8rK6dCyJvrdai
         HpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUskmo3i1vuOo8zMvjpktfnHGwW9h4AXzYzGXWBviGOyDLypmt40CUuEI5bXelB3/RPp67MbiV2XDyOHIy9ImP2PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SbVleR90O7oNhhUaEGycX5V593+2JQ7h/wdH5YeS+0NymxQj
	FxEXQdZ4wCMPC+bD3kevAdwz5/z1DZKKeqLbT2OK0+r0ndBnhrFy/BtTD/xaZ0MqCBGCQzPlsTq
	zd3DbfZyBqom75bU6zKT0DclU5Mrj67m5EUkKaCHV9w==
X-Gm-Gg: ASbGncsvNBeHfcfSyO6RoqItdzByo7mXJaAtm2fVZVnmSpUGXcCfVXNcKilniCKcdCa
	vvwbl+A4xS5MmTIQJ1IIrEXM/McO25CaF/LkbVbvHDdM1vUPBWrjqYAq+hBAeHyEAZ73v/jL0Tb
	uczLMvouEaQCEnSe4xGazEk4O4x/KsZQGAAuneEtLeJRb2N4dXAJl3dee9CeHhoqWCRVFTJkcTw
	I6MZutDTS4Vif6iy+qj6IWELcINi2GG1UkTJnmRCyclo3M1iw==
X-Google-Smtp-Source: AGHT+IEj8d7P3cFn9WHSMlcQJco2rutroHWRWEZV/BsdBzW10JlelDxpX/d5bcqoiRzS4+dxD5+bg22V2Ltijnn3kOg=
X-Received: by 2002:a05:6512:61d5:20b0:55f:727d:408c with SMTP id
 2adb3069b0e04-55f727d46c3mr3142298e87.50.1756834918139; Tue, 02 Sep 2025
 10:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org> <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
In-Reply-To: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:41:47 +0200
X-Gm-Features: Ac12FXz-Ict8QGMZawDnah9byaE6SYSj17yQF92en6o4smsRWpZmv8sya_ULoRc
Message-ID: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
>
> How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to wo=
rk?
>

What even is the "generic recovery mechanism"? That's the first time
I'm hearing this name.

Bartosz

