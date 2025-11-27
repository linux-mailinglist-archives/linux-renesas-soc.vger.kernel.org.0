Return-Path: <linux-renesas-soc+bounces-25284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE62C8F467
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 73F293448DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872DCEACE;
	Thu, 27 Nov 2025 15:30:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD1336ED7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257439; cv=none; b=l9Fmmn0BrXrMTWQ02KOo3Ytt/XIfZg+u3lgUIR01Bj2fp5lzp+XO4jrkOPhwM+kA9+cKokObTlWtfr/LM2RYj9Z5b/G2MgFGjReFweIPcS1FfiVOOp5L1ClXbA9/uN4PQRaUe6UoWdd+Xa0JkajW7EGlTZ5Z44jj2z91IX/LtrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257439; c=relaxed/simple;
	bh=4/tUrL7XhTX2DALHlvFkiLf3U7EgVhD8OVH3jfZBq/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSDjXfxoFgdYuYTVgj//rTZm43nzQpY5iG3dg6ab2B8iBP/N5ICTOiabGjYBOH1/1C2cUF7ZpbfEg33gIgMJ/deeluPmClGGrARXrcgclxhrxRoIvDn1IVbYNAF8xIhd66WaciPWH76HsPXWBUJ49zMsSHCgcXpF1IGye33/JCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso1362055e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257436; x=1764862236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8yl7Z3fG1uBR+uZ4dtJjq9rOuGFg7ujtUeNUk7sXRY=;
        b=LzMStNkQi0Hu26rQtqSbkJ06wq9KdTAD9/WtKEbtiCg2sgWCQ8jVgRVohAIX3jfANm
         MRymT3JNvE9Ox+Ra0hOZypwQAlXd3WmLU/tdH+AOUo97TQhrYTpnP3oKZpKPPq3wbtWl
         MhwK0QKY+ghJdnasqmDahW2ZTaUkqIO+wTG+yhsQvgg4swtjaxzESp87LxrQogJESkeg
         JPD5c89WcORciFwIB9PBb43g+4joNQDic4b0JlmgTB8hAHAyViPymHs66rrJIKU+K3XI
         S0dvRTtM2R7meQE1wjAsEmufILuDj++wwrnwkmaBuXNEw6FEVLPDLL9SlV/AMPgjn+mm
         9iyA==
X-Forwarded-Encrypted: i=1; AJvYcCWlhHK9IUYXOZLDg0LZY/Cj1MhS3MsyvzwWwpHrjS60SF6+7SdSdXMh917q8AdaQumEVM+ZkrEo5aHg66nemzbEzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBcKTXrPagTw8TBJbSG4mScgonouPrydD5IXJIEubZTlsCt2Z
	JvkQCbAgJm+Dgbwzykvodik1GEbVxWRbxf06qjCCH9GrVu48nD7CAZcj7bAks8jh
X-Gm-Gg: ASbGnct6c05uO3fFCOYXcufNfitpX3EdElPeyjzrJHHNlK4QkOxf4tV1zOw3vOO+yCK
	vUzXO61CVIDz7DpwWwW5tLm0ruKF5/+rTIW4W+ZNItWXoHayIJZkLdCDzXQ4PahcebV0rTkvmUG
	TI24pmz3YozC631BgIc8t2et8dIrp5MK0eYo9gIf9vjCQhpyyq1M7rsHiqev4gK6YlOcqRfJx/C
	/37RrPRFQ1lcV4ujF7+3szpunjFArxSXzUw05ZYEw4fEQnAtZE8kxHYljKxt55l4bKUcS1E099P
	/thy9gbmCtsSZpi02As9+diBSQSY31JUIPIjsddjFbNyGIEyTLF9pwyMd9qOr8kO8H6FNraoeOn
	zTdy2xcqJVlXMP/Lw7Fv6XgsOffZJFpK9q8xLl+98VtaVZjPJkNxNlEPmThrIhSB4ns2hkDXCLq
	N/A9UAKS14y4RtSQNVpRTaNvOpl9O8gDyezWE7agMPgVFZNLmp
X-Google-Smtp-Source: AGHT+IG0B/TZE+l1dJOa9oe9K24dMQkxM3oCDqyOQ4PNmGQYBb9TalK9BRh6tZj1ZXuLpSY+vDElog==
X-Received: by 2002:a67:e114:0:b0:5e1:86cd:21a3 with SMTP id ada2fe7eead31-5e1dcf41e1amr8999308137.14.1764257436277;
        Thu, 27 Nov 2025 07:30:36 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d91777csm604052137.1.2025.11.27.07.30.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:30:35 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93539c5e2b5so564038241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAd2fcFe3RaSBlxapQlqbcLRooY5sh1q07ryRVLXgHZw2O70NXxJXPwQqvuciI9qszMxzjSINj7S655JcgARSrNw==@vger.kernel.org
X-Received: by 2002:a05:6102:6a96:b0:5db:e2f8:cf35 with SMTP id
 ada2fe7eead31-5e1c3bb9727mr11967961137.3.1764257435486; Thu, 27 Nov 2025
 07:30:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119143523.977085-4-claudiu.beznea.uj@bp.renesas.com> <2gumxdloes2zpzbyfmva2vhibxzevk2bqspj5ufl4pldrnyzkh@bhcvz5g6kka5>
In-Reply-To: <2gumxdloes2zpzbyfmva2vhibxzevk2bqspj5ufl4pldrnyzkh@bhcvz5g6kka5>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 16:30:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPnJUFT86j8JrmintS0Uxsopn2xp5DhqaodE7tcvt6XA@mail.gmail.com>
X-Gm-Features: AWmQ_blf9gCFJkJVJH4m5BOzOxhNSZcQ6HkuvGQZnhOH5OXCRl3qaE50jdnbaQ8
Message-ID: <CAMuHMdUPnJUFT86j8JrmintS0Uxsopn2xp5DhqaodE7tcvt6XA@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 06:53, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Wed, Nov 19, 2025 at 04:35:20PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The RZ/G3S SoC has a variant (R9A08G045S33) which supports PCIe. Add the
> > PCIe node.
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thx, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

