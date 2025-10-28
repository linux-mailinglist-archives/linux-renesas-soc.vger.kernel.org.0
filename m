Return-Path: <linux-renesas-soc+bounces-23727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F4C13BD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7F71882480
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E1D1E51EB;
	Tue, 28 Oct 2025 09:12:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A02BDC34
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642740; cv=none; b=RJS+XBBVmASFUMgtp5pRO16iyuKhefiPV5DQIc0HH0+6QL0/RXvNgJpeL3vDt0TWGX8TmAMvl2OZPI3fJZkRhNDuy3pRhGv+qpMsOUH1ipoiZIU+sqy/wPz+PmkNymxehei9HzbPtKW2aKBBsl3eJLrabwt0xLo1jp/n+LrHXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642740; c=relaxed/simple;
	bh=g3pvM43euoTNMkyF3tnXObOAlhsabiDRTZkgJQ8/AzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACPWRjvDcltbUnqvOzz6VHUd3ERhB2H/vvSODoXFltia2YtbK9tEjzWb1TbydfIOxkSJh1S2khfaLe6ZII6dJVaLIQTAPNKNIRysepDAky3/YRvWA2gr5JZbpZQPYxPVQ54aBSZ8kELuUjOP3P7qgyDMhXPLXlMvIcD13k0l3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-932bbd6ba76so1925096241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 02:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642738; x=1762247538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb9kW5nZhZJglY2El2oztjCtmhGLcr4GvZ4KYhM1Wpo=;
        b=NR8NKOCJqO4hfiIPdB+ooMH17IhUevHHo6g/SNWe6TeBuTDuD1qH6Lz/JEyqXxdnUi
         wdbbWinmGMefst8Aer+tIg5m1GfOc2dVZTTLqwqa/874mEkBjfXf8RnZgpORSu6e71i+
         myQp7SZw5qnZJiMSy0yIawecTPX0gkDC3PdfN8bWewaqvlBD9UvP5s9vYFTsNajGls1d
         26G75C2uKk2HvutEbBNqJsWLBHDYyIQGX8OdLy04361OBGKao48Uxa+jVPQ4rnNW7U/J
         2NBdrEMvffBKloOa5TvRfv1jdqjxAgXD/gtBVypRBAB4JUofnhoHqDJaviEyjQgXIwGc
         RxnA==
X-Forwarded-Encrypted: i=1; AJvYcCVBq38uuxZYl9j0cNkdzUpReSjf+NVnAMknXHAUv2orQmpqfNyfAVmivVZzTNFVQrOSfM+5uFbDKqzRA9VRCImBzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnaV4G3IowFzS9KQn8e7nrQiUKm9FFmds/u18nTA2i8E/x/Tr
	U6AkqqzKFNNUZldhDQcB7YXnd7dsM+xBSFc0RWA3DWFXZGD+rRbV33IYbUvgkimM9QY=
X-Gm-Gg: ASbGnctKdqMpEQMBp4/s5c6UIhUHmAUhDGf4hAR0CzhVQOno5AKRcNITbSp0rX4tCR4
	NrtgW1+/jNru+/6EGayLLxGUeN7scvONWWXZPz+tHoZXngnrmsKWgZUvVfIk827xOlzyxNP4Q5o
	tEeRquXcJW/zyAQdNBpUVEWLPnlm9j0xNu6AHD6BU/Y6n1i3zdf2+RMPsZ9yX37AN+mUKZ/QP69
	jxQffqa0M2zQc5UitM77xuLY+HYi8cCzjGpRI6MsChSN4uRelHD7yH8IKYgG9O5qJU7mYP6O1cp
	QSoFORsZI5GVz7QvQhDB/hZ7fWxwJaXlA6KRTnP/5AI8b6puxvgSlG5Ll57v5wnYapreSawqaEY
	XH/lJpIBH24VxJ2Vjmw0RhscXuSH+ynJUvaRYaJqXq8XPBblrsUa/AO3Ta8Zr5+NTqiiAmydOEW
	eyx1tXVjKnUR//hiDPUx+jof9mydedIjhoUomPV+L5Qg==
X-Google-Smtp-Source: AGHT+IFcTgiFxVb5dlBUddvqSjtI6D6VBZ5uTydTTEd8daRMOFQSipVfinLGGconlqnmmvensA2f5Q==
X-Received: by 2002:a05:6102:5813:b0:5db:2301:aa03 with SMTP id ada2fe7eead31-5db7cc02182mr888681137.34.1761642737899;
        Tue, 28 Oct 2025 02:12:17 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddba7b03sm4094407e0c.24.2025.10.28.02.12.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:12:17 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-556a4651cfcso1999720e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 02:12:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/erYjLL1Lw0oSzSpdu+vsPGBhHZLu9j4wTCNDrZqnvcOEL7wN5EhAE+UtvjxJIFxr37qu7J6RlN7ppaXSqjD5aA==@vger.kernel.org
X-Received: by 2002:a05:6102:f8c:b0:59c:5e29:dd95 with SMTP id
 ada2fe7eead31-5db7cbbbd00mr906150137.26.1761642737253; Tue, 28 Oct 2025
 02:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com> <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Oct 2025 10:12:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>
X-Gm-Features: AWmQ_blYPEdo4BgGxuQ_Ho5uWeROgqH2E4WHi9ATSE8NxQYZidHzYlYDOH0zie8
Message-ID: <CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 28 Oct 2025 at 05:33, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add device tree bindings for the Renesas Multifunctional Inferface
> (MFIS) a mailbox controller.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/rcar,mfis-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas MFIS (Multifunctional Inferface) Mailbox controller
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +description:
> +  The R-Car multifunctional interface (MFIS) provides an interface between
> +  the different CPU Cores, such as AP System Core domain and the Realtime
> +  Core domain, SCP Core domain and AP System Core domain or Realtime Core
> +  domain and AP System Core domain or Realtime Core domain.
> +  The MFIS supports the issuing of interrupts for each CPU core domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rcar,mfis-mailbox-r8a78000   # R-Car X5H

renesas,r8a78000-mfis-mailbox?

> +      - const: rcar,mfis-mailbox-gen5    # R-Car Gen5

renesas,rcar-gen5-mfis-mailbox?

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mailbox@18842000  {
> +        compatible = "rcar,mfis-mailbox-r8a78000", "rcar,mfis-mailbox-gen5";
> +        reg = <0x18842000 0x8>;

This is an 8-byte block in the middle of the MFIS register space.
Perhaps the DT bindings should describe the full MFIS block, and not
just the mailbox part?

> +        interrupts = <GIC_SPI 4362 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells = <1>;
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

