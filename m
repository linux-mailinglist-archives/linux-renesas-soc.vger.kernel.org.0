Return-Path: <linux-renesas-soc+bounces-26314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36450CF613F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 01:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 310C5302F698
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 00:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964F424B28;
	Tue,  6 Jan 2026 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/SvbIrY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072434503B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 00:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767658956; cv=none; b=L9SuPnqr5/68YBWi2K9luwMJKsr50z2rwPFLhNhN5n33y0E9Sze0ln7Yjh/i/2KH6WygOX5yrfwvAhbceAGPlaFYxEeht2hVhMb7xY/vszHfnOAic9Sh60p+Djs9huCfifnQTy/uH3SNXtiVbXXRUNYV8baA8IZVNioli4pjKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767658956; c=relaxed/simple;
	bh=lb3xJIU4cAmbEjQ2ijfZs7/ulk+CeXUUgu5VW+5oj1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKIJSeFOQyaDc9Ho2cdy8KtN7EDfl325y+ACrceLR//UVu2fyklrM2xQE4Exh1DKiEs9ACangi++yXSahKt/HyS16V/eSVYOyeW8JF6rEoVRI09NFHgX0pQO+8phF2nXTafBxZ8xHE+DWrX438fXGx46Y5Hrm9DlimNWUTGVGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/SvbIrY; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3e83c40e9dfso320570fac.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 16:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767658954; x=1768263754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC8atWW2lGqULd3ro6INkH8g+UL/Nl4BSDsA9fMDcQc=;
        b=H/SvbIrY2k1Dolk4qNEs8j36pZDuPRXFMuSyBAPpfTgW9L7u6BKF5+OBT9E6k7Bv34
         if9lPXEj9MV92e4ek31LYNT2Qpsih+oK+0xtnEKrgauSi69SoN+ezU7bfXpYyi6LDACP
         2HPlG+S99rPrTB+bqGHH5hLkYKhvuahEKrigAWf2pfvHnaKnv/zHbARImp3XhxqSB2jI
         JTntc3KWEgh2ioSDBwmNftPz3EqmimO0sLoP92QvP8ywXaGdQZO6i2Xsf0YL9x1rtQxY
         V/lvUwXRdLGqISeBgHaV+pA7FsbKR3x5AonYZcLd9ljyoeQ7zXNYB4zITKlZ52hZXs80
         Goyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767658954; x=1768263754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YC8atWW2lGqULd3ro6INkH8g+UL/Nl4BSDsA9fMDcQc=;
        b=eKmWyAQGF0Cnap/JZxmldSnHmegllv3fwjSPdtj+/wo3uq8CLlkb1+Kq+6XGaxHzT3
         xXZ1qy8cvBh98yTKckkUwXoGQ5x8DSSqMDE5r/gGOi9DF1Xc7a+EX1n50CbSzl2pLykM
         BTaQiCDXyF0IP41p0w7uJv3ncNLFu++cjeQo8u0Z+sLFJhe3hdEPoNmvaO8GB8IyuH/I
         rTbcDEruc4neUDxC5XBFVzCzlHmdKklTaxErwpIknfeM7OpTo6px0qImSPt4ipEcqgGX
         UcgvIT/BOlXwMI7OOqu7FfrYRCOjPDYToJfRX+/kiZgucZy3mDRLa8vNoxBcnxl3W6He
         OoOg==
X-Forwarded-Encrypted: i=1; AJvYcCV+CU9by1EFhPYoFysNKfu9IFp8Qjy+3mSPQj0uNY/0xgm++RX1l471VOwNN3qUcarJxk0eHIxG1lJz9+sHW/sqiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhF5aoDO/KYR3nAxeyiVi9Agg++4hs+uw0KThQfTN7+UA8s97l
	pWPu8Eu+yheNSrSjC411QTb+dUrmmc9lCJYgVVjLi9hT8or5/VR3U89N+/X1GPOQ0LBlSMZ3BpC
	Ew5sIRVLJ1m31z3pbC/dwzX6IXxMImGo=
X-Gm-Gg: AY/fxX6dyHoSRab1DD6pQqm2DcJZJ37Gmoosp3GtL35QFCWwjcBa5lVm59QbqBAA3Vf
	hGC/dJjKUreat1HtbjiGAxXcEoaUAriyzg8Mnik5o1cTYqnCx11EV0YLbyMnJ9YwNXO0I1YS22Q
	EVLeu5u0T6h/K9X8d83fSv5YJZUZEop7khnjqa16CaNwEHI1RSGRVB2Y1mawpaDb0jhO6N58OvE
	p35ZGC3yrERM6tiyNFvLtdcNlU87wkaCGkVmtusj17Nhlc2Z9BbYgwX7o0Ll7U2Y9Td+2kb
X-Google-Smtp-Source: AGHT+IEm7hCUhWtFwN6YzHtA5nFPcfeQ36GI07C9MBBxxAd69Jxyx12c7XQ7l9P6hBfFsBQF6DJTPyUIF+knef1O6WQ=
X-Received: by 2002:a05:6870:5a9:b0:3f5:4172:25 with SMTP id
 586e51a60fabf-3ffa0d66408mr667490fac.58.1767658953869; Mon, 05 Jan 2026
 16:22:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com> <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 5 Jan 2026 18:22:22 -0600
X-Gm-Features: AQt7F2pVhTJ2_t8N0e1tVdWYM4KeOZy3_JnFAaFG_N_YqpgwdFmOcC9QbI3URdU
Message-ID: <CABb+yY17qrCppYZoXDrw8adgBqEpa3UKnN8aipmA6yLNTqx1zQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 3:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 27, 2025 at 11:33=E2=80=AFPM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> >
> > Add Renesas MFIS mailbox driver for R8A78000 (X5H)
> >
> > Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
> > Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  drivers/mailbox/Kconfig             |   9 ++
> >  drivers/mailbox/Makefile            |   2 +
> >  drivers/mailbox/rcar-mfis-mailbox.c | 168 ++++++++++++++++++++++++++++
> >  3 files changed, 179 insertions(+)
> >  create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c
>
> Seems this was applied even though there were review comments on the
> driver and binding (affecting the driver)? And the binding was not
> applied, so now there's a new undocumented compatible.
>
I wasn't aware of pening review on bindings. The comments on driver
were purely for whitespace, so I picked.
Actually the whole mailbox pr for 6.19 was not pulled, so this is not
merged but only in the mailbox for-next. I think I should recreate
that branch (with this dropped).

thanks

