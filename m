Return-Path: <linux-renesas-soc+bounces-641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F2803873
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 16:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5355E1C20A4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603DA2C196;
	Mon,  4 Dec 2023 15:15:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E56DD5;
	Mon,  4 Dec 2023 07:15:38 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b844357f7cso2422809b6e.1;
        Mon, 04 Dec 2023 07:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701702937; x=1702307737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kstxPCjvcX8Ssr9kxJ1V1hWDPPwz8SWJXbi0LGfR18=;
        b=o01bKJQtPCetAZSIyIDd4SD96GIOxCOEUK+WI+52NV2TohQHoakRGzgv/fQB/HkmQP
         Ie3wkMUb3V7vdQUwqeeNuYsYMan3zUGoJ1CPbskcYH77iBFwmS8Z94+R0f7CmWoqFfvW
         TCy80GRXdIj5nSxy4/k9Yy5OtTxRLfmMRgOABJdQ+GThdnlTkYDczc4XSEqSuBjbGLrb
         0eJnS33XVVlRUljxtoziPxJ/CR8RFVjTGOjm1BBZfLBBdCBfjUbJCHbHyGUkugl/zFcn
         0mwt6iEzRoBPXEGD45Gr6AYdn+sA/pFS8vV8n8ZeZIh4odJUkACXtXtGxIXwq+0D9Ils
         5seA==
X-Gm-Message-State: AOJu0Yyerahnf1Xs33GRlN8X128nbjD+OA6yfoJvCwQAdnEBS90yruiq
	0Wp4pQWshL8yrZyyOrt/cQ==
X-Google-Smtp-Source: AGHT+IEpF77Wb71P+zd4Si7nEYIOWUzkosbphm7w15l28BKVObYeHSfLpLycYh9oyc43u0zODWZfPQ==
X-Received: by 2002:a05:6808:2093:b0:3b2:ee79:c0fd with SMTP id s19-20020a056808209300b003b2ee79c0fdmr4875653oiw.1.1701702937702;
        Mon, 04 Dec 2023 07:15:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a2-20020a056808128200b003b8b28a3ef6sm1104319oiw.14.2023.12.04.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:15:37 -0800 (PST)
Received: (nullmailer pid 1374328 invoked by uid 1000);
	Mon, 04 Dec 2023 15:15:36 -0000
Date: Mon, 4 Dec 2023 09:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au" <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
 description
Message-ID: <20231204151536.GC1260709-robh@kernel.org>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-9-biju.das.jz@bp.renesas.com>
 <20231203-unblock-xerox-cdc5dd68230b@spud>
 <TYCPR01MB11269ACE25217769333DFA0EC8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269ACE25217769333DFA0EC8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>

On Sun, Dec 03, 2023 at 12:56:22PM +0000, Biju Das wrote:
> 
> Hi Conor Dooley,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Sunday, December 3, 2023 11:41 AM
> > Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
> > description
> > 
> > On Sat, Dec 02, 2023 at 07:25:32PM +0000, Biju Das wrote:
> > > Update watchdog description by referring to dlg,da9062-watchdog
> > > binding file.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > index e4eedd3bd233..020106322b08 100644
> > > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > @@ -86,7 +86,7 @@ Sub-nodes:
> > >
> > >  - onkey : See ../input/da9062-onkey.txt
> > >
> > > -- watchdog: See ../watchdog/da9062-wdt.txt
> > > +- watchdog: See ../watchdog/da9062-watchdog.yaml
> > 
> > Should this not be squashed with the conversion of that binding?
> 
> Yes I can squash these patches.
> 
> I am not sure how this is going to applied as it involves
> Mfd and watchdog changes, who is going to apply this patch?

The series should all go thru the MFD tree.

Rob

