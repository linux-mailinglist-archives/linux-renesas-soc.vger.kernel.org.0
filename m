Return-Path: <linux-renesas-soc+bounces-17372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCAAC0BE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE1E4A77BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F6D28A410;
	Thu, 22 May 2025 12:47:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3597485;
	Thu, 22 May 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918025; cv=none; b=KZBx0FmyyW2JCJBaM4lxAc5+5LOOqPVo6yOhPbGAnogFbV7/oMe+IY71aQd9SjvjzNajVq7vo2Ubv175+h5BwBx5T/0Y2qXztpuTd/4OlN/cbi1XmMMKoWdJOOeX7VDc1bftMhCrKc7mSPF3UgByBAIs6n0jn6ttNLmgZMlJG0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918025; c=relaxed/simple;
	bh=uVG4v5iZIBEO4rJZDD+irNtA3vxSxsADvD0HNEZ7xFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSLgUkF5bFvUVEeUXzn+iv1LfMy7d87a35N7ba05XhRBmL2o3ArlITg3oTubaY4Cal3y93Hk6STiG+nDkV2wvTym0hBS3jvSfydekvE1qOOpIKQ/NbQr7jG1IctkXuY9pBy7vtegNtLxUtRmXH+FCyKuTp4KP3A1t50EEbEAUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52eff44a661so762045e0c.3;
        Thu, 22 May 2025 05:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918022; x=1748522822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MFJwS2zuSOokX6d+Q1bpDUjjP5MvD9xhlV2MeblRVY=;
        b=sghLA5UQlBrCgOls4uQ1Ep+kb/XlKli5sYw1/Ssy9JuBilbNK9s0HpJpnRhQmG/tQg
         TIl+hlcghGLd2VzZRq4rc3xcKhnwaWGR3XpYHSot73kb6wQCXpEr7nbPJpKCCDW3Z7YS
         wTr4N/vHEJNJUloVG00KI//qzYu9x2mY70Qssr45sMCyLApXv6aOEsoAmHmaBYB2zizb
         NgY8XmdErOKQBdWEPFecGM/a0wXISAn9itCvDLTpmiNo+gBkBpGw6Pk7+SXg/Pwny0Km
         +jJVIgKhxo7Zpk8HzbyeDm/WflMDN38WaZNOQszMx3RobJq/8Kgl/5OCpy1Fz1d47Ago
         zt2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0oExWA0OKeyOdo9aQVaUg7MvBmxgcHbZrEkthrubj7hugfUfUvjev1x3u9I16fEu/vYOd7KV3bJ3452LA@vger.kernel.org, AJvYcCVuik9EdLRY24cwNMEaIZoGHOyv+lrKqRotVeQTIWArffakWCwJGQaEjVPrhYO1VqC8aC11IR64OIXe@vger.kernel.org, AJvYcCXtzsJlpf75zMZNY0UBuM40i3teCuMC/Sq77CoQbJUhvTrp86QviefyAAXfH26Z0Ho0bRq5NVNGkyKqFjKDkB0E0+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uAsqdLVO4Bv37tn5Sn4JxE3Oz3eQS/Kthgg8mrOg71pF/2tv
	mdis1PiMzsyQ0hRjn8Sn6nfPB0YW/kcT2hed8RUl9SJHn7hGd6aB4wdECjPyM0hE
X-Gm-Gg: ASbGnctnVuAMxCj3MZvj/tsSki18fXFWrEn6dWcsXxW0vKeFANtexmmd3wRRT+8sN2O
	0Yfp7QUest3dNxeqje9jahsAuwoZgSErHupbHjXACdTj6+nbV16Zx9onk/muuMLsbPl9GIUj9Vu
	FQN6akx6ctRYaBcs4N0nmHwqlpkuJ2EBkcrxU+R555ZZkA7TMzKrr+osVz9oy8m25w7nSN2iLuR
	kpXx71Shv+nV3WN9Ln0vjgHE87Q1Z6yjiR6Eb5kBOPvzvzx1yfZINsHknpLUX6PQvH4mTj1fCmq
	gqiYanRbjwQjjIJD5m9mwdVHmisi5aJDwIM2UjyPTMEBPJJD10pHcqBR+OjoYcVFrpoMd6yCC67
	94WrCq5orWnWkHA==
X-Google-Smtp-Source: AGHT+IEt6LuZIxJdlPL7rtMzah6MAakRWep5Nd4yk29Bvs9e0B7XBzdzrm6NMPUZ43drbkbzcT0u8w==
X-Received: by 2002:a05:6122:4883:b0:52a:792e:ce4c with SMTP id 71dfb90a1353d-52dbcc505cfmr19391811e0c.1.1747918021991;
        Thu, 22 May 2025 05:47:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9145b7sm11746859e0c.6.2025.05.22.05.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:47:01 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86feb84877aso1922694241.3;
        Thu, 22 May 2025 05:47:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlgMreR5MSQkPAd0qVUuipm01rt76aN+SN823LHDRF2/Ffb+v2izIBd4nhGIJo/Fs5r4bfgxxWjm5jfPzg@vger.kernel.org, AJvYcCWn/R36Rq2ofBmrU5+shxWkcP5D3te1cws8tD91SLmoJMJslfrl/0CmnKJHt4ublQ9jhABp0HL4fXl1@vger.kernel.org, AJvYcCXWWpQN6yU6YTTsOCET1oMokVClnIxbFIznnCediwrTSVEI1X4I/+zYQwZaj/55v1/2fpBnHt0ZGi7ZljTjHxxvR3A=@vger.kernel.org
X-Received: by 2002:a05:6102:5683:b0:4e2:9804:66f4 with SMTP id
 ada2fe7eead31-4e298047a33mr13225213137.22.1747918021364; Thu, 22 May 2025
 05:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com> <20250514162422.910114-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250514162422.910114-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 14:46:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQcCixTw9jEpoFcPX5TWM_4oihoXaU+7OcrKg_5Qohkw@mail.gmail.com>
X-Gm-Features: AX0GCFuP2xgBgWjXtXOZCD32fWEOrqya1bb6rKGTXtqIwfCF9u2elpQy1OGSVMY
Message-ID: <CAMuHMdWQcCixTw9jEpoFcPX5TWM_4oihoXaU+7OcrKg_5Qohkw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 18:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add device node for I2C0 pincontrol.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

