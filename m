Return-Path: <linux-renesas-soc+bounces-16652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFBAA7666
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE354E1BED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7CD2571DF;
	Fri,  2 May 2025 15:48:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE626AD9;
	Fri,  2 May 2025 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200905; cv=none; b=MiXAUuPpTr/ocGTe73MTtcrc1jWgWey5Bmg4ORzecnPuCIR8lXfBj6S8mzO9RDSgXv+NPNJWdgC8dXHYW2YB1lsMYHYcNhUnrio+Ax/oun2vWXn47hSP1uk30FspfxeaIyYJ8TUHuKHhQyLsE9zHBT81t/kY7nmDIf59A4X8/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200905; c=relaxed/simple;
	bh=GHwfrJaQDWQTfpH0D69gfiO1j3Mm42uDgXjHCcdgIzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pzgb1d7OWOChcYiICbkwxDeDoLwSLfTuMZjIBgxvBzVlFc2nOByKzGhpBK+ZTiDrt90DAI3Xm4Ah1uykkqQMHFdsf63oF32C54O50JIo4/0O4TLr2ebc+5XgjJ5pEtkDO7uwv7meq9emQ0XDcI2XPxyhfJrkLiiikVM1NdpvZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52934f4fb23so1628093e0c.1;
        Fri, 02 May 2025 08:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200901; x=1746805701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5cT6OocslYtTAyDezvSuTXCPS/khRuahF27WQth0fg=;
        b=SGFgPLg3cdw3sthVQR21WWOpDXbm9j6bx4IOZQl1jTuS6MbM81ToOM+lF1fSq9xegQ
         sxDR3woc9ttRMiXdJQbv9AFb99sb3UHI/brDOfGJush3tNPQl9lBiVTXk5reSEyo6qkT
         Jos83FaV0ojDhf+0wB9tAyU2JdA1bFWsCI4BTIKiHJTMA+eg4rzkjxXS96bQWF5zZqmF
         iTEH0G6wwVHJ91RPj7/qT2iAGo3mlDtvCb+Z9/dxnClAOy83b48AFpOK/HucE7kDnXLk
         aFo4R6nvEOf8cFDVLldzfRuVnTxU6u/pDW2Rb/NrxGkmK/ZvAwYOucvUiRc6lwd4Axvu
         7K5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuUNQCHYB5pCxF/Rh7rMp6PP9avYDPleMYrAPJ2GtN5+wtRbRjLLQxaotE4te/Nsnpqe7dKeoxDlmQiExPTDYGcqQ=@vger.kernel.org, AJvYcCX1iHFIdgW2f8q1QY9Vap1FSSUQZXe8cat1LCD6J4SyBrLizivOurUhrx2Vc75I3zI78F0pG8SLHYXg@vger.kernel.org, AJvYcCXrX4Sih+5dD+vkpq6n4QmmWO4UAs6Bw9s+wcIyxm8jivdoHlKkha8xlXUsUlDG9k34qIFiNo9kJtevFH98@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFuL8euWRdTGSfQ9qgijubp7Wm+vf5DNKBxhgAz6fsZQEsqbt
	+Psd46RD9uFkwX5zbMujByYv770Qgau6Td25TgYok18dQvvJQRGZqvnEMGco
X-Gm-Gg: ASbGncs81xx/HEI9KKNdp0YCa+/oQQtkuHuzUrO1jpsRML3qCAQpBwRmWWgK80zSnmW
	vfBaoUT4JNb24oQwNzRmkeNP0WPwCmwMdD3vn7kIpk4fgnsyG3hALcHuCb7Z0dh4XtPy5tR7dPf
	S3AiHN+d5EKB4LEmfNlh/LBq1jbW7IjuMacNaz28Sn9qjqXXbvyux0YQjTISs+K9UdJtfCiAIah
	f07aJiYnwdbTF+XnbNJv8AYVof9SV8VB1eMuuaOPOaYHiPIOWD+SKYTwlmUHHYdYRiMhCL79J8s
	vwW+f7SWQLG/F1LyBIgKa+WMH+KeHg7ACAm5EyIdYKz456JHFTlxZ5OVT61Ng8A52BYcxehHBhq
	AsOY=
X-Google-Smtp-Source: AGHT+IH5Pt9cge/DPNMv5KgRxvsp6RZtI0MGMHbls+9RD77UDJJJBhYaearodtLb0Z+phtB7mOgyHg==
X-Received: by 2002:a05:6122:208c:b0:523:7c70:bc9c with SMTP id 71dfb90a1353d-52aed6d6fcfmr2416745e0c.5.1746200901443;
        Fri, 02 May 2025 08:48:21 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae3ff5ca2sm592789e0c.9.2025.05.02.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:48:21 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c2ffd5d9f5so1470822137.0;
        Fri, 02 May 2025 08:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAIf4jf/1VD7P8l+o5v37SyuiwzW+/03vIuth9z/jqwHJaXAmLsI32na1oN2SQQipz2rXltcQzMoB0YALh@vger.kernel.org, AJvYcCVQ4zieicj9HjxF9qnhAzJS8GP9UREdOwEP/WwQ8ra8JoloHK60brW6koNcGtOemMCg2dO451vn5KSNLSw0e4TBgdc=@vger.kernel.org, AJvYcCXMr8ACZgnmEcwEsAQlpY1crJOLw73cGQL/k52iBqMLx7Z51pCgbcE4jYQnsKqyZzD6c9BvPgsOr/Xq@vger.kernel.org
X-Received: by 2002:a05:6102:3310:b0:4bb:9b46:3f6f with SMTP id
 ada2fe7eead31-4dafb4d1d12mr2476074137.1.1746200900926; Fri, 02 May 2025
 08:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424084748.105255-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084748.105255-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:48:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVi+kM+_ZHfPd+4Vc0bfvHiTLhGcJpgOa=OiPFnPFFQTQ@mail.gmail.com>
X-Gm-Features: ATxdqUEOXNNHtSsK7KqHFI4wUvI8RU1jS7OqWqzaK5JiF3ZWgcPwPzm8QxkxzB4
Message-ID: <CAMuHMdVi+kM+_ZHfPd+4Vc0bfvHiTLhGcJpgOa=OiPFnPFFQTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 10:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   r8a774a1-beacon-rzg2m-kit.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

