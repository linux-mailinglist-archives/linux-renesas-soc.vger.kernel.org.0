Return-Path: <linux-renesas-soc+bounces-15838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C713A85945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 12:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83EE219E339F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDCD2147E7;
	Fri, 11 Apr 2025 10:15:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A551F09AA;
	Fri, 11 Apr 2025 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366558; cv=none; b=M2Q+TkOD4PMa/9n0AgS9B9i9dD96sYRu2kfjBEDZs0drfsuw+mJTW+dH5Z6EagO8uPmUX4mCVXEh/qCekiXBQ4nyl9ZOjBD9MHjSa/RhiBfyRfN/O33QX+EC78FxpNR0QxyqN0sj/XP2jD4EMVjS22oZPyQUIw9Umm72aj9oQ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366558; c=relaxed/simple;
	bh=egPWzhxD06xwpGpoE6s8FT+cKQkj/ZJrgVe7aapfK7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhHs5wn007ryBF0vVqYXqbOjcbVSUJIJ6uFYNsrQkFpeCNMHqU96VmXgYdZGNZAkqBmrBoj2zDv9cnXRnjyIGbh0pPbn0zLF5V1EW18WcokGFUy5+R90K59DAcmLXHKMtmFOv58NE+kth7xn8BVw4COrveD/1KRWMGv9o5J6E2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d377306ddso753908241.2;
        Fri, 11 Apr 2025 03:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366554; x=1744971354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKY5jBYKPjG08lJKcN9LpB+8RzKw8ZlZDZ327HU2/U8=;
        b=BYpYU4Rs2GE2TVDJMUZp3m4rrak0yojo5mJEXTS5aW+ltxXfjwcB6kxWh7Kcyls/DK
         l9CH0/CLmWp/D4LUwtu9hogNxIbFdpt49uh/cY3qlQHbb7BIZt0rPQFkYRjSV7Q0byqW
         KoUcC+/PR/rF4Bf7OlOIWPzY/iJkNXU7EzRZUuUyXlOBPNO7JkhF9n/YRTiy/T1e5kTr
         w957+ppTU8Ky5T3OJBfLg2K8BZ/RBmlDv2ODCW+hRIC9LggifpAw3tcTNWeckx3aFuRM
         /HugZmTNx9HMQWp8oN80YY6dxkUi5fO6rfTtXRcgBBbCORU+7P6H6aucufXm/3oaQN9a
         EmSg==
X-Forwarded-Encrypted: i=1; AJvYcCVlBO2ugd57cMlY/oLPSTzMX9wZIx8+ekpbQRPNhuvMyNk9Qz1E8fqdsMcRFsa+aOexaK1+TD1qxLwR@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEN498A44bdjkh5r4MgrQL5kdNic+H0+tXTIQIU9SthuOEwNa
	1QLX8YoRhIRc8Kceu1t7RHMI/okHcn/XgZW2cNPlbaAjnE019VkSJI+np3jRGJs=
X-Gm-Gg: ASbGncvvZAsnxg41g5K9hdUHGGVdL+59NujcMwBoe9djBUkuupzH/fIWAREIldPb/33
	K6jXMLlk1HYTRlF3l+ESu9kSmctvJtfAwzU9g7LUs1BOgmKP9zQf46YCRgQMCVFCyUhb+asn+Ld
	ZWfismH6KqqFroSQUbQe72mdAww7Q+ICzYdd332h87H/hUTBi+dDgUqW1ipboFucf5DKFjOiQs+
	fPyY5dowgt6Rbn0DnssivSrAGcroI4IzKZJ4b8x6Ts8NdqUMhPQht1XaNCwWeVARgUfeSin+Llf
	u2F1/u77K/eSJdxMCvP0rriu4yQBsCUUgC/laqpGzYexe3f9gXsxkhLj5D3m9edmt4pr/qw7ezq
	pj4I=
X-Google-Smtp-Source: AGHT+IEYB9IFJcCGTgLLCmAfzyok2U9AXPpni54uKIKoEGFsw/DAjTgg4VWwzSWIBID6pt/OQp0YaA==
X-Received: by 2002:a05:6102:330f:b0:4c5:78ae:1e3a with SMTP id ada2fe7eead31-4c9e505b10emr853965137.23.1744366554393;
        Fri, 11 Apr 2025 03:15:54 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875560e312bsm1004939241.4.2025.04.11.03.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:15:54 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d42f08135so706513241.0;
        Fri, 11 Apr 2025 03:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnUIbZ5845yHJkuKOr5e2u4tY0vU4KKVFnuMjM979aa0xT0SKYmSXszt35bU219CyKcxOmzVxF2Jv1@vger.kernel.org
X-Received: by 2002:a05:6102:5487:b0:4ba:9923:fa57 with SMTP id
 ada2fe7eead31-4c9e4f1f22amr1008431137.15.1744366553901; Fri, 11 Apr 2025
 03:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411095425.1842-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250411095425.1842-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 12:15:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk3wrH=oB35v2tyrHVd9w0otqTDBmYc8fwt4w3fhXUog@mail.gmail.com>
X-Gm-Features: ATxdqUGMQcaHz4-sd_Xr-huDtkIPLWR71lzbHFNXIQE5vxs8fZQI_157pUnxveg
Message-ID: <CAMuHMdUk3wrH=oB35v2tyrHVd9w0otqTDBmYc8fwt4w3fhXUog@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: correct LAN LED nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 11 Apr 2025 at 11:54, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This board only connects two LEDs instead of three. Also, give them
> descriptions to avoid namespace collusions.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -6,6 +6,7 @@
>   *
>   */
>
> +#include <dt-bindings/leds/common.h>
>  #include "r9a06g032-rzn1d400-db.dts"
>
>  / {
> @@ -102,15 +103,18 @@ switch0phy1: ethernet-phy@1 {
>                         leds {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> -
>                                 led@0 {
>                                         reg = <0>;
> +                                       color = <LED_COLOR_ID_GREEN>;
> +                                       function = LED_FUNCTION_LAN;
> +                                       default-state = "keep";
>                                 };
> +
>                                 led@1 {
>                                         reg = <1>;
> -                               };
> -                               led@2 {
> -                                       reg = <2>;
> +                                       color = <LED_COLOR_ID_RED>;

Can you please confirm they are RED and not ORANGE, as documented in
the schematics?

> +                                       function = LED_FUNCTION_ACTIVITY;
> +                                       default-state = "keep";
>                                 };
>                         };
>                 };

LGTM, will squash into "[PATCH v4] ARM: dts: r9a06g032: add
r9a06g032-rzn1d400-eb board device-tree" when the above is confirmed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

