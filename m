Return-Path: <linux-renesas-soc+bounces-21710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEBB516DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB36172ACF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959F328C5A3;
	Wed, 10 Sep 2025 12:28:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928926AAAB;
	Wed, 10 Sep 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507294; cv=none; b=HqpKunEEcjnRFWMvNQTGu0uMGm12pQvmw+BtLxnmmlwb5vC66ooGycEmWjAjTZ4xKnjGYWnWdropOpyLxYt7ySDj7WCDS0a/uMGtNzz27bbx65HXvTthrIxYJKVjzMfL3Y1tIsMfTs/JB94LNe1kgcH98B3CUpeBncSB1880xLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507294; c=relaxed/simple;
	bh=L4bjAEH1o0JK/jeYT3aGj7l2lqzXfDiaiCwAYLFb6NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntfbaiWtF3GqEYCkwfV/Qb2bnbqL7CuikRr9IFhMSAXV7/M02TvF2/xWt7zsCvJMPHR5wFbL7dsplE8gz5TvWaJZapjBs3+Z8abk5/Kg/TL26pqv8QW3H+wOj/a4IvZfY59WhLdDU4lDthLUPdvP7Ijn6MWKhjSvj9adRJ2TXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-545df2bb95dso3040183e0c.0;
        Wed, 10 Sep 2025 05:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507291; x=1758112091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW7YzhHQJkY7WdnM/CAx2uPR1cph/idX63DhLteRaRw=;
        b=aYMjODFkngOcynVOW03T1mSNGUassPR1Qx9KPMnyEisK0Km5kvaYfKsPPaLaDXNSuB
         fi33hdHJPa2IDaIU+LILSX8fG2nO6ZHaXLaLNvZ3yKHixFt9AqvoROQXRclIEkdk192c
         4sB7P2kWpLgnpdr6zOW4mdkLPYnalh5uPRsTuP8TJVq13Y58RQyzM7ud9+LvkdQp192u
         jKh13ubq1qCjWQnS0X4Ovy/pyevwAKwC1kxCXsSaiWdUyb+uUl52WGLy66tI61bMmiGd
         ppp9j/dGLjxPTz4W43X0YGuQZYZNls9MTJX5GYJ9gNM+kkf8Acm5ZF8vVMUOn0ruxGh5
         PQvw==
X-Forwarded-Encrypted: i=1; AJvYcCVW54Jf56jHXrd6rZIGpvv2L46daPZRFfAWYJuYwmJTHnM0dB+0Yg96qpwMb72KCkXggtvb7gOfgVef7nLXEDFqDwM=@vger.kernel.org, AJvYcCXLidtamOE1K339PlIHNWmhs697uSEs8HrGK0d8LNa7AbRWIs+jzLomWFCOkMm66D+j2xFwHBxhxhKE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv37YQySjhEyMXZYw9KTuhOLbdXCb1p2+hzLSI0fSnfyJGlmpR
	MUiO/ddR37yMDq3UipWSHjYZjStU0rbuwfy8YaUnbnhzDq5DKRtIwuveIudU1MOl
X-Gm-Gg: ASbGncu1/CVks5VENELw2Sz7CQGjJNQvrQUNhR/UIKmvnQoRSmaBYtXywofHjMZT0bv
	EUb1HY13LPQde59JWtrBLHrT5PXRPEBshi8OknWWba/dQ4reEqVbUJvhlnXXyX3GW7T3qaMxi+6
	Ykp7YVepkW4VrOHj2sVHVe9nJ2pd9MVg4E4FTSeXexj16PGgfOX4V8NNGF5p+EXXOEj14Ta4OW/
	pvDzINZ7rCigqhsFINMnYEDzOA57Be8MCJuDZKof13OUFftAqY1IMAESXyNTHXpjT4rL4Rh8XaZ
	QSVL5RyEV05lIPnuj/TPWDpUH/3hRJ3piihyZxBakcP2Wl4PGM9lfhOIhNJAIefhgTFwKTwjIyk
	K1EDBqgIWace+iPPdNw6l39bXue80xPix8QYnpvYcrFit39J+oRqgZOXv2bWeNHyutG2tf4EYza
	WA9EgKrw==
X-Google-Smtp-Source: AGHT+IHEUtFHr3UFTBlseh7nakrz1ncfSTegxpslVMgEyNJGstzBG3S+Ay+rACtNp0XYWvkv18+d9Q==
X-Received: by 2002:a05:6122:1d4b:b0:543:1d45:a8ea with SMTP id 71dfb90a1353d-5472abf2739mr3861619e0c.0.1757507291198;
        Wed, 10 Sep 2025 05:28:11 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464b7dsm13846686e0c.15.2025.09.10.05.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:28:10 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-890190c7912so1650842241.2;
        Wed, 10 Sep 2025 05:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3L/Ycr6pz8uhpwlt36hiRevHvpNmtbcw7MfmEcRHCDoR9CuRjm0zfCOFCGdMdPZp2xznXTqJCXt/L@vger.kernel.org, AJvYcCUsr8zvFZaHMUanMUZ2eRtWuBqDSlyPMdKrs7yx6qMklIWqUz5eMkZLZh3ZBzCTbRRYG7JOxU+sA7UHkDzjTIABpgg=@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:524:b3f6:fe7d with SMTP id
 ada2fe7eead31-53d160d3ee0mr4782671137.32.1757507290343; Wed, 10 Sep 2025
 05:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com> <87ms73vzen.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ms73vzen.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 14:27:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaxG6bwbCG44FW++TRohCtHV64GNykWeRenv7wK=TK1Q@mail.gmail.com>
X-Gm-Features: AS18NWDGjjslsafTOV2qHmKlGQtNee1KVedWiSlnl6J4A2ThSrW1mM-bbqs6Za0
Message-ID: <CAMuHMdXaxG6bwbCG44FW++TRohCtHV64GNykWeRenv7wK=TK1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 04:01, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
> as used on the Renesas Ironhide board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

