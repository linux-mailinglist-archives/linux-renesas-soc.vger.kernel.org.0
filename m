Return-Path: <linux-renesas-soc+bounces-17046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1CEAB55CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150933ABC83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA828E57E;
	Tue, 13 May 2025 13:17:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243DA1DED6D;
	Tue, 13 May 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142265; cv=none; b=CljZAgzqn1RL8iuKcgUUcbJHy5bBFABwSMDRuT8Wv8iEd/QbJ4IkEuNBfrYZ3upXfs/LBW8Kd60eFiJmcDdWgxPLqGzm4h7lO+Scq3oazSh13QHxBRJPaSg/65IF/pCNXcS8IRsNHW3sXJ5n7T0QZ7TlbAu+/of1WGuoHubqmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142265; c=relaxed/simple;
	bh=XPhAVW7nrR8wzdPpqqQMTJtsR7CbV4OJLpPZbauNjxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcUlXVGYPdRhnYRjWdDvqspHE0ZeH7GbKszOUdStcQT4EwhTDlKwNHoFuYu3rMd7iv7ynbt67EGxDWLnTECGo9ns+IVaeKuXdO3FhUABKJPcgVmU41RcGQ7uqct3UOS0oEhS3Pt1VeUR5s5wHenTNWqDNPOpI80n9qmpjltSAP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c53b9d66fdso840786485a.3;
        Tue, 13 May 2025 06:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142262; x=1747747062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkiL2mrEZZwE/y1tC5rTFjuEboDte7NmK20xqnMc/Wg=;
        b=wDNqiH4rl3UJrHmNoM+odFW6+/w3hXSD5Mcf8/z56fhpIi2u+FSxkR7Hzv3RTlieaO
         CDO9bCkAE9E+6LvNISvcaLu6KGmZocvJwPsnz+WOKGMCWnK8LTAxrarnoXsvJFfEFrsW
         sWjmpmN8QEoLYUsdfN0kmR4EP4xc0EZVjNVPmPHXML5C4tpUaCdmWPYzevODGiDqly6K
         61hngbdVJL5y5a0FgPpBO14MuhfVOhAabfPVVeRkU/BvG5xxZk1IqMCFwzPld1cT9FFx
         RY4O+ukfyJYdy8xBxvRVZ772dBjWqn3AMhQ4MOg0rAqEbdUKq9LQEUwZ+JWer6oH4o4g
         iPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7E/tbnm7vZkLlOk0F4+htnu37pEMUIhG2xOhDKjfbTMkTrP6EmMdaGQbx5BFlmpeCyiMSvBhNO64nEanJ9USwJ2o=@vger.kernel.org, AJvYcCUqF4rYNCMxQBR7Uvv0utZ2m+IdmWP6eiBN8DNqIGtYmH5y2FI3dLI2MxJKLmJMNbjlhHi4VNhsx9FDj3+S@vger.kernel.org, AJvYcCUtraYnmJ408crmsp2dbzwr/1W+8bJJC2o1Pd+b7mS2JhgMkS29V5dsFHRyImJp1xIG9nuHFVjHcszFsoxM@vger.kernel.org, AJvYcCWHlZnA/W6TculK6QnPG1GezFUSmGr3CTuTpJsKMexzG+ux2z26U4Gmwxljuh0ulFp3Y6MqvO6LZjA7@vger.kernel.org
X-Gm-Message-State: AOJu0YzqsWZQeAWuAJwkvFPE7s1W1zioTC0B+oxJPeB2J/Fn6H0YjNZX
	vGgE7RaldGuu4f9Wa/ASpIAGBgsD9teR0g84on+cYD/ZYGKyjrR53twL0qWH
X-Gm-Gg: ASbGncv1xET3o1dE+LYSCoqQO9p1RONCDfJjz+xaOIunqC6Q/OeXiOKFLagC5+Fl8j/
	axlC//R6tu3Y9KGqMBcb3EjM7IQghE/ygUGTEhP5j/j4y61mE5FCCA1CHAQShbW6TwqYnohK4OF
	eYQeE6kwhUFOwYf4q55LiGQybH0GMdt/8ZK64XmFY6d34DaF1TNSUvXy9GCGNC2YMJP664T5MBe
	SRsv/cfjm0RrvUlT5KbGiReqMm6rHaIMKV+8WTpop6h3XSRvl3xQzp25MqDWjajZcaDR5yj2CIt
	j5cGsAC+sAaxsYbOkNzIskhE8M0Ah2yM1iTPtzAXHgEzlexvSEeIq5+HjfzgOr/e1Y+uFHMnYmE
	YSPKmEIKR0G6dPOKm2A==
X-Google-Smtp-Source: AGHT+IHvJ8dEfKcNnXMABz10UaeeT69HP8Lk1wxbD9iD0qaf48/IS1MSPT0RnbBEjYoxj3+GAFAkCA==
X-Received: by 2002:a05:620a:2a0c:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7cd01178ec3mr2272929985a.53.1747142262532;
        Tue, 13 May 2025 06:17:42 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f98908sm702015585a.52.2025.05.13.06.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:17:42 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774193fdffso98559661cf.1;
        Tue, 13 May 2025 06:17:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2SDZPO0SMbkblp4BROnw8Zn/VvdN0k9LyId7Vx1rjBEzLVvPSFbtQID6DSEstQmK7m1+Xs3r5iT7f@vger.kernel.org, AJvYcCUeATIqHoJIv50COYOddQ6NCKDS4h/JdawObz6/l0n54rKhVJXVftJMq8PwJ3/MZNg4LeBcNRStl24NQf0GiNm0qkw=@vger.kernel.org, AJvYcCW8KuQZUBGQgWmbvpXlEPdbaxHskH70X5vYR+QE+w+ij9VjiiR39Wmso7il9RuxCimvn0HEk2SFqQtlmvtS@vger.kernel.org, AJvYcCWVQjoj/sK+gAvBXBdYO1tTR0q9zS2d4/JXoLh+SlUIAOBz8sKAynrveYdhdNRgj5eiQPmhq627rH2Y/NoZ@vger.kernel.org
X-Received: by 2002:a05:622a:30d:b0:476:6b20:2cef with SMTP id
 d75a77b69052e-494527b841fmr261435331cf.41.1747142261724; Tue, 13 May 2025
 06:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
 <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com> <CAMuHMdX_SVtXjQ_c1w0=qcWHqc+68u_EkJuUjm7R+s4fOYoMBg@mail.gmail.com>
In-Reply-To: <CAMuHMdX_SVtXjQ_c1w0=qcWHqc+68u_EkJuUjm7R+s4fOYoMBg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:17:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxKs=4tUg8iNFDUFdZVSmXz8SvZsDnbjvmbQ_FBsRhwQ@mail.gmail.com>
X-Gm-Features: AX0GCFv5UTlUTi8kd_Gbxa0jm4WghU13zL99Rsuwl_OkDeiWAjs1riAGF7hi30E
Message-ID: <CAMuHMdUxKs=4tUg8iNFDUFdZVSmXz8SvZsDnbjvmbQ_FBsRhwQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 13 May 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > At boot, the default clock is the PCLKM core lock (synchronous
> > clock, which is enabled by the bootloader).
> > For different baudrates, the asynchronous clock input must be used.
> > Clock selection is made by an internal register of RCSI.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -35,10 +35,14 @@ properties:
> >        - const: tei
> >
> >    clocks:
> > -    maxItems: 1
> > +    items:
> > +      - description: serial functional clock
>
> The Hardware Manual calls this "operation clock".
>
> > +      - description: default core clock
>
> The Hardware Manual calls this "bus clock".
>
> >
> >    clock-names:
> > -    const: fck # UART functional clock
> > +    items:
> > +      - const: async
>
> "async" is the name on the producer side, not the consumer side.
> "operation"?
>
> > +      - const: bus

Actually there can be a third optional clock, just like on all other
variants except for SCIFA/SCIFB: the external SCK pin.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

