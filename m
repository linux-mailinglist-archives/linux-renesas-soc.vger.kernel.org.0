Return-Path: <linux-renesas-soc+bounces-20613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83BB2A138
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CC023AF7F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52A231AF10;
	Mon, 18 Aug 2025 12:11:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2F27B327;
	Mon, 18 Aug 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519061; cv=none; b=AaUwTPkndzCTAi9Hg4pcPckJMTMGjdNhOWeWd+uSmjfMokoXsCyg4fA3z/a6TW6qK88xldx8LXmeT2Sm6PHYXQjhv4xC4TPEvy7Xn+Ul0GT5DuVojXNU3tFpGMB8fkjXexmqqlml4tZDCwKhVC5aY6rSslENOKihHWQHIVqOVu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519061; c=relaxed/simple;
	bh=tIcAXyCej7FNIQEmTQrOHnKVp1xVdmprX9L9FmJp05Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoyET82ikN3xkzNIzId09FYG/0pqONZWzNCr9ovdkdaFsfiO0cNudMa84KsFykDEoHB6tgS4M4GMKFavjPEEKOxblRrZb8c2Y8FZqVtqtMRjGsZDFhUbQ6aBimeq9pi65NWgkjENTRBS+OHiHGweKYL9KTU3wv+6lyIHdRK8ymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b174de200so2816745e0c.2;
        Mon, 18 Aug 2025 05:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519057; x=1756123857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/Lcb/V3C/4LDU2ngsHPwowVNXxiN5XTtmO4aTBnndU=;
        b=JSphkhdpv85Zt6k4WRaBXZ8JRN3TXgvMCSeJYwWIfcoFMqxF2rL3xEA/q3MYaFQxwU
         nBVh1PdF2Un0Av9IuZCHsKIhVL+acrhdc8jbCZMrmSmdYsDaQX+8/JUn5E1NO8yOeY7X
         l4RKYVQu75P8iIIYXC0F3PG3YPGhsevw6y8LQBz2kARYU+NhzLTWrwQ+e3lSt/05MVIm
         mRpBr6H861lgg3leLTY+q1Yl3hnBVEleLi5OlIBq9UWMcm5xTd0uInTNG6RQ4LPQXy39
         r+MdUIhTWhJRh4YOGgTnWoYlcOxiXcN2hvLv7mJ3wThYjmxoKiiuxl7lXem0jaiQH1I9
         EcgA==
X-Forwarded-Encrypted: i=1; AJvYcCVmRXIgAk/4YXOwoCTNy2QoOJ0T3dp3f4nxv5XolI+g5xmXWY6dXBD5EWwrrHvBRdscvViI/35mVx0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxncf220k8T/qEWToWiH70+HBTw5HA7JDLbIiiLw3+Y5z8BuzN
	mTcWLK7UZpRFZQTJtdYilh4+MplooD49F9rm9LxsMYuq5oy6fEQXx83rgQpQm+0I
X-Gm-Gg: ASbGncshjUBZ8Pp5QhJYXSTVL6ce3JrzzFurXx/idQ8bAoo5ifyxjlQqAxa2eV9wKMT
	sbTL0svLaD80V48jn3Ju378+XbA4O64gBIWeYKUPi4hqlnhOyugG4MZ2uVjXjYDHLapVvFnG7eq
	rgaYm2dJSycjs2EzulcFHFLoVJw9oYGkjtG2oXXLxPbCilJd3NE8MXeWO9t1ppc5+BukzOn65P5
	AATLyUP0FphcYZJBO6LIPlhSI0enP1FfM7liY7tnOOMv6tYR+m8On0lTzzcStG68eF4oP9xEzzu
	2pW24SJArBK9THUdjSpm12fOmKXEQUpwrERMedA21puq8RxE/S+hVo1qtHs6Q1k9DPT4wou9nmx
	1F2ulFKVbM2MENwyoWm/BBRqMDDDgbUFa7h/es5j0Y4mrkCbuFTzppjIqy18h
X-Google-Smtp-Source: AGHT+IFWoJmLAlDb8Iwk0udKSHaOqCR0swgs0Tm354TpDNwDugBqXz8h2Ce6mCxlUH4eDOdMm8PSxA==
X-Received: by 2002:a05:6122:a21:b0:539:345c:f229 with SMTP id 71dfb90a1353d-53b351ec8a2mr3555593e0c.6.1755519057377;
        Mon, 18 Aug 2025 05:10:57 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd51a3bsm1802820e0c.1.2025.08.18.05.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:10:57 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89019119eeeso2544361241.3;
        Mon, 18 Aug 2025 05:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/a4hW8dqeOcvjL9uR++GLWMzQCvyx2bOdBsc5iIDLnqVQ6vUTzD1XmLO7CjaIF9+YVh2VcRrlIeDR@vger.kernel.org
X-Received: by 2002:a05:6102:32cf:b0:4f3:36bc:554e with SMTP id
 ada2fe7eead31-514ca6c7f90mr3337891137.16.1755519056835; Mon, 18 Aug 2025
 05:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com> <20250807151434.5241-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250807151434.5241-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 14:10:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkPA+4v0yYtEh790Kz=Myida6tXam-LbhrdNNkVSDwzA@mail.gmail.com>
X-Gm-Features: Ac12FXxaRT08uPJofTxmAtBw_BgTjxqRDWnUbJB3S_EeNHG9Ifnz5qOk2p7yscA
Message-ID: <CAMuHMdUkPA+4v0yYtEh790Kz=Myida6tXam-LbhrdNNkVSDwzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a08g045: Add I3C node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Quynh Nguyen <quynh.nguyen.xb@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Aug 2025 at 17:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Quynh Nguyen <quynh.nguyen.xb@renesas.com>
>
> Add the I3C node to RZ/G3S SoC DTSI.
>
> Signed-off-by: Quynh Nguyen <quynh.nguyen.xb@renesas.com>
> [wsa: adapted to upstream driver, moved bus frequencies to board file]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -272,6 +272,41 @@ channel@8 {
>                         };
>                 };
>
> +               i3c: i3c@1005b000 {

> +                       interrupt-names = "ierr", "terr", "abort", "resp", "cmd",
> +                                         "ibi", "rx", "tx", "rcv","st", "sp",
> +                                         "tend", "nack", "al", "tmo", "wu", "exit";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18 with the spacing fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

