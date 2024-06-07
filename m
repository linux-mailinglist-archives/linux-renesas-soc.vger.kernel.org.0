Return-Path: <linux-renesas-soc+bounces-5969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B9E900D1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 22:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC48C1F27CAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 20:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D201552E4;
	Fri,  7 Jun 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh0nnY1s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351F154C12
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717793142; cv=none; b=psxyttRAhtzhK+mFP7dvK8WtlFNLk5X9fxS+xi68QpAX8sUd1dI70d+GTj5qmJkjwCpHz5eOSY34fwyei8FdK9j5WkI73RzGgdCKbP1diT9bhSOWeIN/hIEE4V3vOPfhruumkxELsMV6q41g8wBp1CFiQ10BMVrBp4xDkXitLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717793142; c=relaxed/simple;
	bh=tF+lqoc7ry+mrtN2VK1nYhL8pQKe3mXizJvWJ3MmaUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpDjdX8PDNdzb8pQCbfw3a3QT34LyfpKdBMYSqGBGqPjj0MCmBwDsqe7uMKIW19+N3NO9Vxtf36uwMwalylTSnAYucK276Vxr9gzq/7ZcSwOW4LsXwjSXCUAXt/Gn+3c45h7wZiMnqovIeGOHJjYP3x49+GfpzfGMD07LgQVTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bh0nnY1s; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso3319434e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2024 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717793139; x=1718397939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/8+vnKbwdVGwXWCUHLo+YQ0seiC+NwOuFIt2xs/BGc=;
        b=bh0nnY1skuGN1nG46aMxT+8Jnct0f/S+DlYGDMdoIgyjiCpJACTFeQElq/ntLyzpSx
         KvURzE8tmom+rzH2WOyH2svElrpZEFruOdt9iKSpAdIZJ0FolOp3W4R9vLzBPSLB2JEE
         ztNqnJgjJqP0niaFxe4ni9/uhQd3N+9XJgcpX/UtB/NCJisZ0fcb0qPS5Z6kxgJYu79k
         hl+4mH0NDJJplPw39551hzAfbvmQYm+2xeBarF4bF8Zn6hjBO+3GuvdAF/hsHZP1WllI
         NAB8uzM5KE2746625wSZ7UyzFHtkPhExFWKp51AH3eMOsIlWxyBBLuurA8G+Kdj7TiY9
         F8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717793139; x=1718397939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/8+vnKbwdVGwXWCUHLo+YQ0seiC+NwOuFIt2xs/BGc=;
        b=EYBZaTtp44nr8a1ARu2/Bw0eeyBGZOuVzsTpxCxTFJfjLJ1upLWe25m1KxS1aZDEmC
         t3ARWJrt4HvvtaT9tpGArCzzOYinYPxmjb7q/3a8//MEytwcVCNZsT7QEWwdqZZuivRT
         Kxq8JED8+WSVBh+PneJbuA9ETrgvExZJpKb1aLyGclKboxnm/4G2FfuDMcpYXTYgCzyG
         RZi0j6lLo+JSA/2w5uZEJ3IWk/CXsv3IRPrD6codtiXnxsTVsOGHsAY/cjOHsqUJZE6i
         OV5dPmXW514pWLbKc9MsHwe+pstU45m/KhLhxQav1HZhRMu5DrhKF5Q/yRAueDcg8fGe
         VKMg==
X-Forwarded-Encrypted: i=1; AJvYcCVw/OIygk177bTaIWu8U388x17c5QTcgyV8FZeAxvPx8NN/HJTrc229cGKlxwV+yPJimW29/No7NsZhwhCKdBOBs+AIJCkBALjD8/cghT2HVng=
X-Gm-Message-State: AOJu0YxRSzalhx3OTIBHyUVFgXF2nGxawyYR+Z0kTGsOlXakCktt9de7
	/A52xs4PkZQ1BSSPtIiypBlb0O2E81/X4ub0EQYhlPP3jRkdwjWf7T9ds0IUTmjrblhZLtttqXg
	o8W37caQFzxNMHKps0byW64KYB4pfJzOTKc/9qQ==
X-Google-Smtp-Source: AGHT+IHd129BNp9Srlbj4xlaokQuMVuM4ydYbqkksSF96LY5Xo8WmbmTC99Ge/pqhA4iwFxOEqgvchTfrPRAyuItoMw=
X-Received: by 2002:a05:6512:689:b0:52c:7f25:dbac with SMTP id
 2adb3069b0e04-52c7f25e446mr10179e87.20.1717793138663; Fri, 07 Jun 2024
 13:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716974502.git.geert+renesas@glider.be> <a30fa2c5e0d07752692c5a69f5a5fc57ae719c1b.1716974502.git.geert+renesas@glider.be>
In-Reply-To: <a30fa2c5e0d07752692c5a69f5a5fc57ae719c1b.1716974502.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:45:27 +0200
Message-ID: <CACRpkdZETWojdSDTT+ownbPtsr4LipT+eDxRA8YjQdGSEmEGdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: Add R-Car Gen3 fuse support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:29=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On R-Car Gen3 SoCs, the fuse registers are tightly integrated into the
> Pin Function Controller.  Add support for them by providing the
> rcar-fuse driver with all needed info through a platform device and
> platform data.
>
> Note that the number of fuse registers on R-Car V3H and V3H2 differs,
> while their PFC blocks use the same compatible value, hence this is
> handled by checking the top-level compatible value.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

In case this needs to go through some other tree than mine.

Yours,
Linus Walleij

