Return-Path: <linux-renesas-soc+bounces-15567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC3A809A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85EE11BA30C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BCA26A0AE;
	Tue,  8 Apr 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTXSrNQf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A126A08E;
	Tue,  8 Apr 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116335; cv=none; b=MTyyZFYZqSAViAgn4akvwYg33lAVC1xDCJeZL/puNRBNv2PfCb9QzFY5PTESzsr49ndp2npOmATmjtjO8LLMy3fLnRGabEVm9FHt1PhZ6naE29xUz93+QAlMSh8NM5Qte7p9tDgVv6ZoeSE1N/9EklqlknADUm/4RxIsnwE0QdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116335; c=relaxed/simple;
	bh=UfX2oZ512LIWHF8adss2anxB8PcOJOHbSPlPhK0+WgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njbDT+e70SBoqz3OsYXgw0gK3HytmwEsvplW9fnxiW7Eht7CJdYSC/vMSrxUWv1zT9KZvkfBy8pg2ViPTcSxZW2oLHNPd7Vf0+T46d8ZIMbgDFV9q/b0ythtOVngnSUFz6ipClzS7uJA1H4EnrqNJkXSBZQ+yHp7iUONE2pcDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTXSrNQf; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523de538206so2423326e0c.2;
        Tue, 08 Apr 2025 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744116331; x=1744721131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCUfDk8Wpy6YLCT3cmf2+GSYL0xanBiWidTTdERXoLs=;
        b=mTXSrNQfYIvyZkS4s4tpL8OTjL8BkA+Qm5ryjMChWa8+OBdAqnfKFskdxf2LVuoaOi
         elhBr0FtkhWkK0TKPjOgGKbFGIYAmXG1UOvR/NHiXbfRve4T8UuFG4vREm6G9y+wI4uv
         N07UeR/5ZQCq/8hiCHepusjpG7uHcYmQJKSjMdaZxMUe/0zaP37sn013x2l82Xicd9oa
         HqUcJ9mJE1hkoSiEXQyzEwQdJTR4zZOIQKURvsonG+XLbCxHNh9kLdU/eMEH4l8G2l7S
         HTZc/7UheNf7sy3yqm1F4V+gF8Vx984X6cGSvCpbYGr1PFj8Xn6XQtYRPXNBxcSyU9cb
         Ni7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116331; x=1744721131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCUfDk8Wpy6YLCT3cmf2+GSYL0xanBiWidTTdERXoLs=;
        b=Jb1/PB5JqJbKK6rxLf2a1VK/JM1JZJWz34dx2mE37csYAUGsLQZ51MCnjP8FXDt0No
         AXsvdPBIGc7P8oyGOJXJf/xAy9jBKAQEg3SpCzElb4jHgDePawzcY6fPCukXga4+k9Dd
         daj09icmDonZmW5ilhxXsJhJFrw6OlxFVOTjUqRrx6JKxCbnj2DRPnRYNHWTYXSaJKsF
         1rLwjysWR6S1IUankIXGSrwpflJAKtFdLQLDZB781XtpiI7B+x263WWU4EWt1isvUij/
         ftHvgFP7LDXUkR7KGd0ioVwjGZRJ9mOxBG1/sbQFHosSjg5KDEiLsxIppG5HEHeRCtY7
         4H/w==
X-Forwarded-Encrypted: i=1; AJvYcCV1P+GLrMdS0EpS1LK9p61mk+DLqv8DuH52LB7WZ6Aecx2sHLha/Ng2YWTTzx7SPcFSQxMCsCp+gf/x8HOgp0rPtDE=@vger.kernel.org, AJvYcCWF4l+AxvRki2qyWPRmdVJzB+h9dOO7uQ5Kqlg5CqZPeIkY5CB2rTas9JQO98C86VoZF7YF4vv96/Qs@vger.kernel.org, AJvYcCXZCSF9VluqRoAGVQpNfhczsRJD4WNvV0fCIK9IKlMuK2dfsCBMDv/qq0gMhwTzlridPm/CNVMPg241SjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC0tk9988e8ouMG0tK9WLj4ylNUiOHG2iECc6q7zaVhHVQw2Wt
	gbGRpIaFEbDRDKpUdT6j1PnMqAfsuDw7ON+O6DwvFRJchFW1nHw0JUV8RzEFf52fxB/aBQ9xrWt
	tdYCwZC/O5PHYnsSEFrmujfVzNcg=
X-Gm-Gg: ASbGncutQfRM8lccnJpprXqWEDTQ2L840ZuDQfZGaPLLhWzYdz39bRg2mEs0qkZuhKq
	JoS2OL+VoQkCZZghAXzJgccZ+vQ/qwYnrZKvn7Q0SN9zxfNJYNZh0ZK22QUkw2lJBiQf4TBQvpS
	TQDZDhtWT5wQ3SHbuAgyDTqF1m3mtfTsVg1j03nXt+dCMH5iLbyEo1rfSfrdOXHP4VbP56
X-Google-Smtp-Source: AGHT+IHTAqillLElByfCXdiowxrLglQTthe56WV3Rq5oTwQJkq0LedDRIEvtz5ggo7IYxUqmxbHV/KgVaYqLR/V38kE=
X-Received: by 2002:a05:6122:659c:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-5276443fba4mr12367299e0c.2.1744116331368; Tue, 08 Apr 2025
 05:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <TYCPR01MB110400F8DCB038CC28BC5C04BD8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB110400F8DCB038CC28BC5C04BD8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Apr 2025 13:45:04 +0100
X-Gm-Features: ATxdqUHcCkywLkFaBW_wgO1uOdmEJJpTjepowyESakdf0kHayJBxPyY9etgrikE
Message-ID: <CA+V-a8uNMVcKZgJwZKptOB62UyFD==t0HPOc4j2GwaKwRrzKQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Tue, Apr 8, 2025 at 1:37=E2=80=AFPM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hello Prabhakar-san,
>
> > From: Yoshihiro Shimoda, Sent: Tuesday, April 8, 2025 7:40 PM
> <snip>
> > > @@ -721,7 +736,7 @@ static int usbhs_probe(struct platform_device *pd=
ev)
> > >             if (ret) {
> > >                     dev_warn(dev, "USB function not selected (GPIO)\n=
");
> > >                     ret =3D -ENOTSUPP;
> > > -                   goto probe_end_mod_exit;
> > > +                   goto probe_assert_rest;
>
> nit:
> I think that the label name " probe_assert_reset" or " probe_assert_rst" =
is better.
>
I'll fix this in v3 to use `probe_assert_reset`.

> Anyway, I think that this patch seems good to me. So,
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Also, I tested this patch on my environment (R-Car H3) and it doesn't hav=
e any regression.
> So,
>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
Thank you for testing.

Cheers,
Prabhakar

