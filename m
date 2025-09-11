Return-Path: <linux-renesas-soc+bounces-21777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C6B5357A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 16:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D75511CC2AFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7E233CE9F;
	Thu, 11 Sep 2025 14:33:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5859219301;
	Thu, 11 Sep 2025 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601199; cv=none; b=h4vSlaSRfDPqYTj3UK9HUUlTar+bgx4kMLQiW0uXfnxvoWR/t0pvNeVLw2w253SgGmVg0f9Y9BlNIJGE56bCdCE4uw8uL4Rn+pUPf2szVa7LVuh9LcKr2DChEypX6xKKhxdmdEIzu6hHlJoj+W4vaul5XMpegsBEElHCP3PZo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601199; c=relaxed/simple;
	bh=VHhlVIuBdaDU+8PEYLzyCQ0H1QgdUb/zU81eSShlOus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjaV4hgVWnvRvxmuM+6/ZgQXQ5gJz78AzZI2P/Rwa9rijOXezld/zrVpODCt8O7b8SdnOArEBqkBW+WarwqzjLVGc9wgv/Ty/PbrWVOrTpMWD6u5+qTDtSAn36zCcCOo0PCGafUjIWhmG04flcCrFTfvmA5Y03BBWWU8iipaOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8a1d640b50eso555267241.1;
        Thu, 11 Sep 2025 07:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601195; x=1758205995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiuhbKCWVVhxdsKroAmlHWewkQOhNypPZ4OriaNJghs=;
        b=MoI2hWfgnZJgWTCueYPLEE0njFJr4eBResvQMUjiGxPkqCKC2auXB9EkyzNJCynZ3G
         YUWIESZTUoi/DfgUveSAI5nLikgDdrpvUXJAYHzQ5Djc8zGEv2GaQz/20Sj+/INB0rc4
         HZ+EcWbeqKh+ghcVcmHnyYU2sxuj/JXpCUcDbB5gcdBRDKomCHcpes365ESx5Ydupnr9
         lk3CvoC3rf5eb51a3wAvGpYhYj7OxUSKfuf5g8r+WHUb3rvJ3WZYCIbbHgO0HlrO4Rgo
         aPbkLL3t5SFtZPIza3f536sPMMbRxpnuer8y92K8S7awP/Mq09UMvdqpNul57t5cyPCV
         VnAg==
X-Forwarded-Encrypted: i=1; AJvYcCUKGPlrydaxaxtB5Fer9kstPl87BvKT5BuiNdbmhAIEQlbghOl0JedovyuTfRPbMS0nbG+C8zCWtl0Y@vger.kernel.org, AJvYcCXyGNSJpAeTDIg/RhB4j8zTOEgLd9V21mvOSVXvUvj9JYypQQmxb+bpVjzHj1x1CFGVl3x+zjx32mniFxkGqx0xQb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Jq65pxgJrwQG6Ynwx/NQEoBn27ivQqhnT79tHbW7cFguqpp0
	KuLH+tEUrIsfq/tmSWyV9AL3SBX1IP6cE8GgsL0QrTVObDA8qF5quTQLPxI+JEPT
X-Gm-Gg: ASbGncumWRze1Mlw1XGcY7i9hMx4a7J7Rgga1b8I2C4kz33tvAOni/aPLr9KXYVMgSi
	XlF+cYRCjq17ROFyyJiv4XfO2fpGL5+EAnAN9ShGYGch/9L8RzUrsWog3PFihS4MA9Q8lFs/rkG
	n5yg9gYAF1oP7OU9eh1ubmNW0L3rdim9nbpCmZDoCVmndcRsrbrtnDd6DsRvuQXRaUbGrP2a9ON
	ZviR5Tgm29FY/MmsigQDS90KcapKyw3rq+3ExzqXPWqN2Ai5D2CVLovrehdIGfNsuqT40EMO9Ov
	uSQq7sim4D5jLl10Ss0e+7kC0s0QJadXYXfMElZCaZOU3gYg4W9zRcVmhfCm/31JidVerC6aUj5
	+znEgrxkad2dxnUBkFj0xrV7wRJmc7KLTCQTwW++LDj0dUiOS0Puj81gRlkIr5NVbyCX7dlg=
X-Google-Smtp-Source: AGHT+IFBG6T2lPj7yZSyghGYwtyVqZPwYkR/NdWbTPqEzjuzH5K2jFz/qRo3F0wF9J7GYcHnsE8zxw==
X-Received: by 2002:a05:6102:26d3:b0:524:e102:31c7 with SMTP id ada2fe7eead31-53d217e8c69mr5760281137.19.1757601195176;
        Thu, 11 Sep 2025 07:33:15 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccc7f680d7sm273282241.3.2025.09.11.07.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:33:14 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-898f53a21ecso538461241.2;
        Thu, 11 Sep 2025 07:33:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW54LoWQoeDZrYoJYxxhUWZzHCHw6WIYrskOOCqXtu4L8t0VzvD45SgQ/EYWW0AQgp7Dzbwgxpa3iip@vger.kernel.org, AJvYcCXRUxUvGwGAkeVtb1BOrjxDQ000mH/tK1N83PogVNeInNnOPIfCmpRVZwJy4d73JIA9jc4/EvZjwbuUWmbBNho7CNk=@vger.kernel.org
X-Received: by 2002:a05:6102:38ce:b0:4e5:9c40:824d with SMTP id
 ada2fe7eead31-53d217e8e3dmr7178916137.16.1757601193870; Thu, 11 Sep 2025
 07:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org> <20250904210147.186728-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:33:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMvntAp+1jXtaq00VWt_H1ve_gQMzCO8+-XXMkdUUkLQ@mail.gmail.com>
X-Gm-Features: AS18NWAkNjkhFfnvLiCqdymOJJqMhhU8VAOilED558TJ2nRrUGNRMgRWyD2k9Lo
Message-ID: <CAMuHMdXMvntAp+1jXtaq00VWt_H1ve_gQMzCO8+-XXMkdUUkLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a779h0: Rename dsi-encoder@
 to dsi@
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 23:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Rename dsi-encoder@ node to dsi@ node to follow node name pattern
> in Documentation/devicetree/bindings/display/dsi-controller.yaml .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, combined with the previous
patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

