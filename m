Return-Path: <linux-renesas-soc+bounces-16773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A818AAE7A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E3B3B038A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F5328C5DF;
	Wed,  7 May 2025 17:18:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CAA28B509;
	Wed,  7 May 2025 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638321; cv=none; b=hutGtQxEiXvscK9O162A2Arqxf60qx7Po2umB1vf2t+Pdza3HlY3BHGGqfs4CEJXzPBVlhYkH7mDJAhCleDlmyoHorKmZ/FrM6kpAc4gnUR5+3oyXcSWxNABesvMVVH4fhIPpjcCIJSWTtVJnatWmqgScsFRdiMoiixusHRq/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638321; c=relaxed/simple;
	bh=54KqbbaXmHYTf5Dma495Htq3rQCJfljLMH6zn4UWE10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFCwOrwtMRxvZKqaq6g+uNeyJB/phZNnMqyN+VByxv5DioED5CpcICnjwlOUvY1T5tTl6tLjGMxkAY0fxZGuojmBqEynH1DZJ8IwJl8plwJ8ssqIJeKhFyh0P3puf1b5CIi8dXFYTiYmHftpjqAsGtDsWeCxf3hBrqXPX2ew08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52413efd0d3so23384e0c.2;
        Wed, 07 May 2025 10:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638317; x=1747243117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/34IxyblwQD/YuMxKpMzhvDwg+RJxwfpaU0x5Z6Vu2g=;
        b=xJAwZXIPo2h0KDbfyj0KTWWSMXc+HRts+phUzkt7bw40dgAzShT8FuzBBExMc9zgUP
         inxfPSdkXIO6p/NzooXFonXmQ29N2MSyOVQBKxwYjtBiYJNXurHQ4xo6P5pL7xb+iZXH
         itirdo00KcvKbKBsPvkQI+fcptTK1Q8AZapS42+x+tJ9naEgPKNK27nEYWLGv44uwLLr
         0fFFtZXq7qcWqJHhcAOFYI67NVRnVbvK3vqOUvjej3373rgJoI6vPsekHeiuxX1ePoa+
         OSMQtlYcltjUeBXf4llwN1o6oe96fz7P1l4BlD5QBR6aV4Eofz0TmO+tIILNl5zUoEnu
         s9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUxnyorSltAKLKR8H/Yckiez0EgFbTS56WF1FfIKBAW2Nk9/8rMJ3XjTPfC3INW9qSiOBcMc13cy+iZ0kKnMPn5ENg=@vger.kernel.org, AJvYcCW7hrCcRAW0xNTAnJAOhvTW2b+qovJ3xvi7jZTPBGBgbqeinf0snH0XzXQTMp+HDq1mVEVY3IyeAu+m@vger.kernel.org, AJvYcCWBsIv656o8lZot4tyf8sHkR3xLAfIQX/yYmWuiiftRebiT5DvOzkxXN8GnB+88XY5BibGJPbp/u69o@vger.kernel.org, AJvYcCWrzPK9BZPoIDpC9LtLTOTzWC9f9WkZIaJ1YfA4N/1uJRYYIg+fhi/9xx7yxP3BVUIX2QBoT7QDP5eobIV4@vger.kernel.org
X-Gm-Message-State: AOJu0YymmVY7Nw80sOvmMgxIzK3SzRBuj7bpjAy2MnXirANDZuUwlmrC
	1cy1oR1Oo9aN3mByRseR1ZLzgqX8oO2LfKOR8hQR3qZBOem1qYZplGMPt/Ob
X-Gm-Gg: ASbGncuG4vfjxm7ilknKN8fMijo6SRwSN8SdvaSEWuQ0wLp2NNI8p0IMLnIQXeUqRxj
	xu2Vv8D/KqPmo0tLgJ1KWnnSinS86a6XtuH5T4mMdkSPrLULgx06hYFtuTyvLgZjuODifBgrOqk
	85On6FZCrwBgIBy2lAKZM8salt3cqALqiXJo2YbxIAN0QSkTB2c1b540Mk/6hNbKSRFO4Ksfx0z
	0b94ATx3ZYcTpFR75qGAE7pQH/21g7vgOm2loyhNTOyKnigGNPnX9EBeP2Q5E7aKDEyuTz3BEch
	jeJpfpZi7vQgRhoq0Ui4sBprXNvesbKdW7dH83mzMLmQ2HTu0xIa4zgiji6fwTb3AbPbXp3IxYv
	Wt5U=
X-Google-Smtp-Source: AGHT+IGOBEesZCo6Rj/V+e9IU7gKcK1yAHeydcksz9HnciEKItoZCNB6z+FMamiADjWyokROmz3lTA==
X-Received: by 2002:a05:6122:4682:b0:529:24f8:dbdd with SMTP id 71dfb90a1353d-52c379c4166mr3418514e0c.4.1746638316992;
        Wed, 07 May 2025 10:18:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae3ff7a07sm2455194e0c.1.2025.05.07.10.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:18:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4dae6255c73so24078137.1;
        Wed, 07 May 2025 10:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5Cj4DXARzCNHWCNNW0jkqb2ow6bMyjv7x//zRspWxiltRrFXtYy/8bdMQ+Kvbva7OypgzIofNIcahew/y@vger.kernel.org, AJvYcCWGxfwSACRkpB8xOr7C8Ml4Yp+vYr6NhL5XcXnefNTcPaB+1mqwte4t8MuAsI+85Rd39VoJSf/0Szhk@vger.kernel.org, AJvYcCWcQhWdn2nDc9ojOEE3iacfcNmpHLzOzqe4ZIwD3Wgot4AG2l+0cNne1p9p3f+28MUine6tEzQGIcTyvjsUzjdOCUU=@vger.kernel.org, AJvYcCXK26FWAqMfypXMuuOt0+/QJob7gNFNAM9Lat7I7bSwJ7nSNp32pNdLPvuw3OZ6mylXg31/7OG9n9Px@vger.kernel.org
X-Received: by 2002:a67:e711:0:b0:4bb:c8e5:aa8b with SMTP id
 ada2fe7eead31-4dc738bc384mr4000134137.22.1746638316153; Wed, 07 May 2025
 10:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 19:18:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtdi8CapSVVjTdP0=p93LW28Ye-w0HE+65tZCre0REnA@mail.gmail.com>
X-Gm-Features: ATxdqUE2gHkZyrR0xiOi-ltfL5EUFj4-RsFBtlBlUp9jPNzmrSslVjC2bDVuufY
Message-ID: <CAMuHMdWtdi8CapSVVjTdP0=p93LW28Ye-w0HE+65tZCre0REnA@mail.gmail.com>
Subject: Re: [PATCH 7/7] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
 #power-domain-cells = <1> for RZ/G3S"
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the
> Currently, there are no device tree users for #power-domain-cell = <1>.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

