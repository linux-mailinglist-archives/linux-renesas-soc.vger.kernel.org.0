Return-Path: <linux-renesas-soc+bounces-14765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348BA6DBA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAEED16AC88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7DD25E82C;
	Mon, 24 Mar 2025 13:32:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3319C569;
	Mon, 24 Mar 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823123; cv=none; b=H2K6w4HQEzIoidAdmUdIzrpg4hNZjzHw1mekCZeOkSNzdi3a4nY8XHzV8Z8iMGgNiuCob3sAiyfJHxkHWIaBreF1uL++BF4dojFTQRNgo0u5Kn2NYESs50rwdsQuA6VpX/LBunZxhPjz7rfQ6EOoVU6CrReeJTCKfLujnvsRu6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823123; c=relaxed/simple;
	bh=U7Sm8drjhhuf0oB9XuCn4Y6s8zWfPJWtUiwm4WERSR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui7LqJjuCJwOEfCm9QbzLx3qNhjmWP2GE/2KC+U6KERjUI3KYqv+S/cchev9xdKZ9QGfx6K4rxC2LR3lOdZE5RBvaYOzrg3HNnfgthJKt+oR92TxGtl8XVIqUIDjnpdIuEDSbf4uo5zFYA7Rh1zsMS6nxdBegpo/mxQJnGW3O/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-525b44ec88aso1103659e0c.3;
        Mon, 24 Mar 2025 06:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742823120; x=1743427920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnTkaFn1tZplUqMgdVjTtixweNlaqZzoddw8gwDBD6A=;
        b=rhpYaWm7Uk/rCJMHzz6nrooFQymAUQTW5Z7DR5INf2jFBoEut657deei0HejgzykVN
         H/G1ergu/P+Gu0G0dgc2g8WI3NhLkiC3mk/25AOw2DR8O1fRUSOiIKDmEv1pdh6saAdU
         QOsPUsgk3QWUrALGUjnpwFk1k5yibxDrxC8S+r0uaYBN3HG5v9f22cqplP6KWNXGt3D5
         HX5cGLEmQNVkfBLxUfNhpcKhIWyrAm/XFLepK4Mk8gQUIDBCZIDuCx6ezrYUc615yt2h
         z4aVIlzajsA1HMTj5HYb9igwjEKz68j6tkb+MPP149Ki+Bh94DtObUhXh2vR9ft8AD3q
         Casw==
X-Forwarded-Encrypted: i=1; AJvYcCUIvZW58xZV8Hu/9irKOLuKCoRcKjWDFJ8o7stQt43eP4mfFaj3qQQycJ9eouOy2AbQSn9vZFfvi98Pk9ClWZMsdLk=@vger.kernel.org, AJvYcCUo9BfSqFK26ijcaLf4p9m4Qr7UKURJWWEFkWEEfSccP4Tg9geg+30687QURphdpb6oM9CwCS4XQr50@vger.kernel.org, AJvYcCUoTRjGnQt6P+qGuO7tItZ8oF/z53dST8SkssiuRNotwDl026x6pChCGNim81WRAUZkAk6ilTem/IO5Y5dD@vger.kernel.org
X-Gm-Message-State: AOJu0YziBZOG41Vdk10bayvy10z562Zh+cXuKMuyUO2JBI90utpud08F
	cruVYXTmKLOOfnANOQgQpuJxRNVAXhQsihZWlqM9js5NIBXPocFD38HIUdY1
X-Gm-Gg: ASbGncsvj5KN4O1yYbzN1X3nFrNjXe2IZr68E+SlHvl78G5cJOxFAU8YLl/ZuI/nTuu
	8iS/ynV7E/qApOw9wvqGDK3nQkTCejsoM0i83vBiKrc4t99jz3UZGNlZeOpea3F4UiONrPQDyI4
	FnD2H6AwJj+tjblCQD/NOFM4tLDTVaoQ1I2iIozTSyPhKerJv8tI49oyNuCmlaztalmomBrQycW
	au3pr6RdUVGoXPin76rG1KgUQpz2Z88mMUuFwZkg7No2Kr9lgWcdq1lv1cFZDm4ToJhsD+PjH+O
	4zPeA7Fk0eJMpDEVWhjEQOhxcb0rI4rLIiZN6D5XFXJS3OJf3jlvGS3j2A4TAse4yoCEyOge7Pl
	rHGU1GdRJdPc=
X-Google-Smtp-Source: AGHT+IHmKPnSUcLRyxNG4lXDJnIdwA1P2Ib2REO1ZyDXTngMRotthkjP9n8WBkPvUm1tqY+Kv3rEFw==
X-Received: by 2002:a05:6122:8493:b0:525:bf40:e628 with SMTP id 71dfb90a1353d-525bf40f5bbmr2179238e0c.6.1742823119796;
        Mon, 24 Mar 2025 06:31:59 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a767186fsm1373373e0c.46.2025.03.24.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:31:59 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5241abb9761so1776849e0c.1;
        Mon, 24 Mar 2025 06:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/4hgSIulQ9i0yBFi2E9W+N8yxlWwedGDjJehkg7sQwk/REIFkF4hhh7qBqEchgwumsCNtKcZZNlx+pVXZ@vger.kernel.org, AJvYcCUlre5lK6lVdcElgTPNFTEBQHXgsz4EhxDxZJubN4oMmk/asbhTPv7J1Z3OWKRDLvuRlDXm6+R4a2mW@vger.kernel.org, AJvYcCUu20hJdarOuDicRKfax5fWWQ8TM8fWFKvESCinoDT24xLUEyuRiz1foYYNGNGxxdOrjw+11w6gOmdCW7X8ZQYbiLQ=@vger.kernel.org
X-Received: by 2002:a05:6122:660c:b0:51f:3eee:89f2 with SMTP id
 71dfb90a1353d-525a82f6994mr9180028e0c.2.1742823119399; Mon, 24 Mar 2025
 06:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324125239.82098-1-krzysztof.kozlowski@linaro.org> <20250324125239.82098-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125239.82098-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:31:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkePsSX62+OyT8aTdqFfaNy9dGRM73Q5AuQ_pHTBi8Kg@mail.gmail.com>
X-Gm-Features: AQ5f1Jql5zVib3xf6ikzA9vsEblCUa1jRbqsyGwqM1WFnlicozMsfGBqYmldRFc
Message-ID: <CAMuHMdXkePsSX62+OyT8aTdqFfaNy9dGRM73Q5AuQ_pHTBi8Kg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Colin Foster <colin.foster@in-advantage.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jeff LaBundy <jeff@labundy.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 24 Mar 2025 at 13:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> +++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> @@ -60,43 +60,34 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>
>      i2c {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
>
> -            iqs620a@44 {
> -                    compatible = "azoteq,iqs620a";
> -                    reg = <0x44>;
> -                    interrupt-parent = <&gpio>;
> -                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +        iqs620a@44 {
> +            compatible = "azoteq,iqs620a";
> +            reg = <0x44>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>
> -                    keys {
> -                            compatible = "azoteq,iqs620a-keys";
> +            keys {
> +                compatible = "azoteq,iqs620a-keys";
>
> -                            linux,keycodes = <KEY_SELECT>,
> -                                             <KEY_MENU>,
> -                                             <KEY_OK>,
> -                                             <KEY_MENU>;
> +                linux,keycodes = <KEY_SELECT>,
> +                                 <KEY_MENU>,
> +                                 <KEY_OK>,
> +                                 <KEY_MENU>;
>
> -                            hall-switch-south {
> -                                    linux,code = <SW_LID>;
> -                                    azoteq,use-prox;
> -                            };
> -                    };
> -
> -                    iqs620a_pwm: pwm {
> -                            compatible = "azoteq,iqs620a-pwm";
> -                            #pwm-cells = <2>;
> -                    };
> +                hall-switch-south {
> +                    linux,code = <SW_LID>;
> +                    azoteq,use-prox;
> +                };
>              };
> -    };
>
> -    pwmleds {
> -            compatible = "pwm-leds";
> -
> -            led-1 {
> -                    pwms = <&iqs620a_pwm 0 1000000>;
> -                    max-brightness = <255>;
> +            iqs620a_pwm: pwm {
> +                compatible = "azoteq,iqs620a-pwm";
> +                #pwm-cells = <2>;
>              };
> +        };
>      };
>
>    - |

The removal of the pwmleds node belongs in patch [1/2].
The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

