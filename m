Return-Path: <linux-renesas-soc+bounces-17422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D7AC2019
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F165C504F6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B66A22540B;
	Fri, 23 May 2025 09:46:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48582253AB;
	Fri, 23 May 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993602; cv=none; b=s+EBzZ4d2G04j5SZC1yaJ5eiEe8LVbHKhhV0ybz/9sK1NG004I5SdJJ4OATEJm71E2v6vJDYiGF+0++pHiqyywMKLXu/Oo/RyH5rtCbPWcloH+pug53e/f0Ya4JdBM9SEeMyTd3dZAx2mzP+BORCkDY1N//La94s5qV7gV2FyKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993602; c=relaxed/simple;
	bh=xqa/HSFlliZVLQFtzZUC+BUP3sUivsPlNaXidDaf0sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvGDn06lqNo4xipWM72Jtkx8Hfm3j/iouFDaHyv4njv4AZO7r0y4UGVUlaCiEDPm1b8iXRfKLRcWFmiiGQmk8zrhOqkc/c17nWEEFSpIkCNLUzksKpjRVFwyOUeUiZ9csUBogw9TODf1ztK43Ksl/KMDPJZE8FjVSlfNfImqaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5242f137a1eso2780482e0c.1;
        Fri, 23 May 2025 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993599; x=1748598399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMXBch1hfTjYIe9g9/nID/K1NoViF4Bz1jBWL1za1do=;
        b=P8NhqScVZ4lxT6gkfAnQV1g+NYpxVSwsILJDujIU8o6nfusquXY5riMA2uPJMc+qal
         /UljWC+S7R1RWnb+bspnQxu+HVunre5tp7sd8oNiATgm3fqDKLs0d7IP2FKSKGy/dW00
         Y6aA5P3MXnUz8hNSIMQuG5LHmkVGKfK3PJSVajUtgdXEjXwHkUxLL4SRYWJ6wC9YMs30
         1wo2W/m9OEFFzKlRdxrjYKkuFiKYdYJl4FyGe6cdZ7/wpFeTh4v0v7q5CRwhwOIrwegk
         0zLhGPSzMo/0n+R21NapYPMISq5PJkUracPAAXZ3CYFq7tZ9wAWrGfyh1q8PDX6++c67
         AE3g==
X-Forwarded-Encrypted: i=1; AJvYcCVeVWcSqIbZEsiphw8BZUXkO5ATrL2+DhKLefS79mpNxK5pwtNplwAnls4L6qJh/iRWkUNjDUBA2XKFQVg=@vger.kernel.org, AJvYcCVqU7VgWK6hiWXEq/vs/WNJjQeOX9+zES8IzrcW7X9/azwWUGpPSefYNyhZasrApeXsCr/iqYQUs/THu6l8@vger.kernel.org, AJvYcCWeRpK92gkqB7EV7SnRG7XWx42llM9Tcjo+JQ1pgUviUBSEXKOGtNDWF/9gpaEoxo+iVu/uF6XydGRVSNDoSDATT7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54BOyktwXn+2sDOs3AQ2SlN5bMVMgK2Fck6D9LwX5HI3h4Jaq
	SVBv+XdOM82SeR8eokRgEQJBJSTF57+VtBnQYtwgPyEtSWstj6CJeaJRkzwAjJBg
X-Gm-Gg: ASbGncttcJuY7EAZ+qLhzxnxxq9xbBOgD/z0/FCM4vHH9VeI5YNunx8TKB3iGAJcwds
	51rzdfsOj6FYPOsF8f0bdyhSuhBTvO+oscD2qvDyjO+MLT8hqI38A8S4N8ZqPCBWnjUe1EqsgRJ
	ESUeq88pIjl/W/gu3PHWI7suhZ0xAbiQkITLi9dmENS8B2BqwuFoXTjEMrRvYX8B4FbazXz0qcJ
	b/BkuMNfn9fVcZwxe68T+zjv3a9ynMWkUAkATIZquxkU9bn0d39RBvMeGT/vVOH99Cr6bnsunbh
	0vlnlCEifattoui2f0ncUdITapjGWJDCqy3DiMqhMQ1GPMudIryeJJjf8Rb+Hq9z3HY00WVtvDo
	pf7NihRBF35qzKFL+Rw==
X-Google-Smtp-Source: AGHT+IGhm1uIBMRMAbnuZ3NK9nAI+quuaR/3sPDNfHLG3Z7LZLlb1/SbBXdeDIqk0C8QbZro6A86YA==
X-Received: by 2002:a05:6122:ec9:b0:52a:c0db:29e3 with SMTP id 71dfb90a1353d-52dbce1e5a3mr21890570e0c.10.1747993599006;
        Fri, 23 May 2025 02:46:39 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba7584dcsm13435722e0c.0.2025.05.23.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:46:38 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-525b44b7720so2668411e0c.0;
        Fri, 23 May 2025 02:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpVco+BbaeWB4A1h1uv9/Xzr20jLs6RQCnCAXNhGQyi1qEXHoDmFoZp963wYdlf7B69q9fOc8Y7ySKwUMWIPO09iw=@vger.kernel.org, AJvYcCV7KEVhNBwR8/1q6enlXxMAtejvN71KOjsxd1Yd5poyYSBTClhHm5W3+IRWoLw8YU/eh89iK5dfnaBTfDjR@vger.kernel.org, AJvYcCX9oQS/BdQxvlhF0Tt8OAO5nAEH9EfVaFZmr0/r4P+/K68tg72J94Y42u6H/T9laFSMAKYxJcE6y9ymH2M=@vger.kernel.org
X-Received: by 2002:a05:6122:1b07:b0:52c:49b6:7f05 with SMTP id
 71dfb90a1353d-52dbcd6d4a1mr25286007e0c.6.1747993598445; Fri, 23 May 2025
 02:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 11:46:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUShe091nRnAqkL4RKwe21Oj7O95fK7UG_JcJ-aH72Cdg@mail.gmail.com>
X-Gm-Features: AX0GCFvlOG4fTS9H4cNoeEJRhlYFUJpsRVO_9sQ-rvGJRjgTg2PY8_QrCilW0x0
Message-ID: <CAMuHMdUShe091nRnAqkL4RKwe21Oj7O95fK7UG_JcJ-aH72Cdg@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:19, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> New port types cannot be added in serial_core.h, which is shared with
> userspace.
> In order to support new port types, the coming new ones will have
> BIT(7) set in the id value, and in this case, uartport->type is
> set to PORT_GENERIC.
> This commit therefore changes all the places where the port type is
> read, by not relying on uartport->type but on the private
> value stored in struct sci_port.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>  - Shrunk length od type & regtype
>  - Uses BIT(7) in id value
>  - Set sci_ports[0].type & sci_ports[0].regtype in scix_early_console_setup

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

