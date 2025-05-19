Return-Path: <linux-renesas-soc+bounces-17200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D581DABBEB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 15:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7DB1B60D13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC7B279793;
	Mon, 19 May 2025 13:10:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927B279787;
	Mon, 19 May 2025 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660249; cv=none; b=jHzNnL1Zhdn3qfPjgzbGja678wz0nU++nPA0bcEHXoUOJft6D+2kTiiv6xCNF1nlrAz53lUljF8XMquo97GX2x8Dy/Czycsq42P8xjyADUlqNVeojrXIDpOu3ncf6XuP2fD4v66wTygBZfY2LY05nO/scdY4rLcCpmH/RkyY0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660249; c=relaxed/simple;
	bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULitqdhBkFI+9YapWMBaei5H3Eu6NlRZ3rbg/tngX2ByNmsQww46Mqwo02YSURloUSXs3eyswq6LVV51O8hvp8w2eFKzk+sbqX0qd1o5T63N1uZH0hrtVbQWNRlNSVatv1npIMVR/uMdZaFf1281SLaCvzCvZ/iKNeu2WttQNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5191020e87.1;
        Mon, 19 May 2025 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660243; x=1748265043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
        b=nJcBWzdMS4k7L/ieMu7EhTk1DFfShG380NcwxwRqvCsCeVj+0oTC+yPyLGic1z5qaD
         +KG9gH9rWvWKaz3/Y8pz95I5jcKlkCPSRRyt+P8TS0hyYhaIJfXYN3Xno4uaMJ6Eer+e
         VXHcPJR5vk9+JVoOoC29EJVXn7ylVm30687EwnyXVfDEtYkEJX7tBqM7Y48/0HN8EWya
         STdKHOgQ9nEHdav9gjsCW7QprQm33goumMESW0RLgfOFH1xYKTlhPWQVw3LF7ih3n1vp
         9qsH9ML8In0lX7G+DX4Mc8KMadEDKfSb5Fhyzb8VPbd1tBNkT7hr89rSF4bcXJRS6gz0
         /u4A==
X-Forwarded-Encrypted: i=1; AJvYcCXVo70UOlD51evSL+VQ2mB2uIXWLMhoJt6OuzpvqXqZZkUy9vFw5cKWwyvtFTfMko4yCx7WUUDCrOfH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQq8zE8eA1ahS4VW/R4keZZ2SwMI2r0GxIKdjukMlUVvXp2zNR
	Y6LU4/UM0/qWTWz67kgtdVFD5L+12xD00ZMNh0XZHmgE+ywm8RW1+vY04PozRKDvIoA=
X-Gm-Gg: ASbGncs1yJx66hCjIn7WWxSs1rxvW6HnMrAIDWdiyGttld3jELP+btgvoZ8wcvReLaU
	p3iZkhuW1D99/YmffEjyaE/EBEwmL9K0UOJ+ja/MwrXPaeNaBC8xcSv+6hiUvp0uZC2IYE2COXH
	LRx4Kq0ofGuB53ZGzvHuC7ejJk8nyYpF8t6ZTWudvGxbTifK7nKIxIeH0sth6dQ/624thQ1GGW+
	+tkiZAzAa2jZxFiI8hN1Ylr3Pcpq1ee+glbX/a2Q9jpXSwuhBQTUgxmhSHF0cyzmBi3DijDwQWc
	zz688Ci0wVozc5A5E6JMJ7r5UdXDcW2ktuVF6uLfDMe11n5g3THLY0tev6kAyjQf74+smp/hdyN
	b4r3LaaO9
X-Google-Smtp-Source: AGHT+IFLQt2IjpE3Zd3OQ5l/5C2BHsCp677Auap3XJgYfMzPLl4yV67Oh2fzPmdG1Q/tJXaUdIO9KA==
X-Received: by 2002:a05:6512:4508:b0:550:d4f3:8487 with SMTP id 2adb3069b0e04-550e7222475mr4147551e87.43.1747660243126;
        Mon, 19 May 2025 06:10:43 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f7dsm1853659e87.117.2025.05.19.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32803984059so22050481fa.2;
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCEUqLhhUL4Eb3228cGrFjyWAhoQ3IPo7IBEPAcZfLzdOg7oCznVBBtk2CDXWawtmhJMDPz7G0CtX0@vger.kernel.org
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr32090081fa.0.1747660242500; Mon, 19 May 2025
 06:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com> <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 21:10:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
X-Gm-Features: AX0GCFsxXp0f6XTIbmnJnSjvW3P0HJFBLSxCw1t28jUvhSs6_4fuwFkzC0zig3Y
Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO
 based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:15=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> There shall not be a '-' before the number.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

If you want the SoC maintainers to take it directly,

Acked-by: Chen-Yu Tsai <wens@csie.org>

Or I can take it after the upcoming merge window.

