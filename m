Return-Path: <linux-renesas-soc+bounces-30256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HNSC7r2w2nPvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:52:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC053272D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B52431A979F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56E13A5E7A;
	Wed, 25 Mar 2026 14:38:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2623DE43F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449532; cv=none; b=XCJPTXQwKehW93CpzcQo8vQ2Poh3Hl7Pkym1qX1uH0np6N5qc9G4rPwjX4gmAevDqKObxUsGskjTTslKdf4QXBNA936bHCRiJQSnIBck4R88+PACIBIaEArbgYCQNfRZCmNnJtkPAoqP540S/Ow3EsI7mJjy7lPXK802F/IpnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449532; c=relaxed/simple;
	bh=KIC26orWxGaAZWFOgWwVtXKisuiThVkAGGA7/jTdMSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik1tUk2D8Rqt32cDEr7KohA0C5zdkR1FpiwXwJiP5vX/YsNLbpo9Vs3vwS1IvKlOE9mcgyOFX24yYXWEWUzZTPdo50Ivz7JFG7EELWCXgs4YMNs1/jX8D01kn9dwAbQg4QQlMJWZvhJM9bhOqUR7W4HRgpbX+K1qEXnnvwszZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so3147a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449531; x=1775054331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IR4PMQkuXHgGVHr1fS3zbP4B4tvfpOd5H/w9R44nhs=;
        b=DAhsJCA/0I1TqR3y9oPAG8xbs4pEIRuf1JnVjbBm9wJzYxGIC1EXRHv+qdqsFPNkL+
         KDAJHxypmh0jOGyQzBjmzQAvdKHKJ9faTpsqIEUOePRKkh2UcrOetU5qsHJgWn+5RlHg
         yE6f+LBmR3nuvHr7NM64a+xTCXsa9I1bHVVjDZ0DqMCjZhTqnol62r8HvwAwaW2rjLV+
         233Rh3gJqIXDNlCyRdaEz2u0nT5RJjQMejeizlGPYanSXObS+tmjfa8/16+5fqXPEExX
         IzCAtFer67zV+++vA62oxXy35sSwVonFCYgJUeHFBhJnaSFMgKhudNcuxb/ySyJi+Jn+
         nMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkYWZXcE7a48/J/JUq6YS/8T8WZZYx6MKr2RAcOWkRSPQxopz1ikxV4WNmq2ciWc9UaOzHSbfQ/ZPFXoA+3fHPTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIZ/aoo3t1a0f+vHQIGhxDuXI0pQ3PMAMUeKCs6SQj/AlSeyX
	7G3LPkhwX91ccBrcPEkQs/wdYN3wFVlsdi0U7P0e3LRjs1ILnmSRNK6aPO8DKrcasaY=
X-Gm-Gg: ATEYQzyoZseInwBO+W3ruBmPitLlvbZGUT/voUsQ/LcEQqaFGQJQC+2EnVWoqVonZz5
	hHR3LQuG0rJDNg+cPaRlSmov86opGq3ws8aONIDYYqkjkIfTefTQaxjuHLKHk8jTXAl1mb9B7/L
	dgaiudl4fKBIFUIjSrlwT+bs5tzG2kradyEgUeyJXw1cTShzg1rbfE8i2fznI1Xp+JFB4DUNnRg
	Rzdy+fe1PF+PkxMJvKgCi7awTpM1xBDhT4aLJvqBllLYBuVbYd0SAFoo+v+d5UgwaNnlU2wXqTB
	VF3RZZt+jSiil/pcpScuMnZujeawYeoFJLYLZoCvSFbFKGI/jwTp5zMZ40unLI062yx1XUL9Rim
	BY+6cSyNmly7WXbgn8pYN5Rx4eZ6515oxu5jAO24NrQUrZwdWjKekYJnTigWQ79KMXKtBKlIAOb
	6+Z4wgzE91NIMjnWIycPlET/O/Jxynm+Nbi5MQkV+Jlg5ZQfIz2MLIavKiGP3q8aDnIX4yLPUer
	Q8=
X-Received: by 2002:a17:903:187:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b0b09fca9emr40435115ad.20.1774449530490;
        Wed, 25 Mar 2026 07:38:50 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a7e3bsm1385195ad.27.2026.03.25.07.38.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:38:50 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8299f1ca894so3980262b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:38:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDsGVLiwyTwWkLHBaq7d8Tk4VPJM9dOyZcPaSy209Y3gIclBo3uVgdd2TXwTRE3VW1Gw7sLmWy/acJYVkyr/sCCA==@vger.kernel.org
X-Received: by 2002:a05:6122:8b17:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56d220bd240mr1842211e0c.14.1774449143358; Wed, 25 Mar 2026
 07:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
In-Reply-To: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
X-Gm-Features: AQROBzAmzdL6WbhshCdeY3LBceLPE6ortgojdqfCAR4hO6ROgmFwhIjzLsI-de8
Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,mailbox.org,lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30256-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mailbox.org:email]
X-Rspamd-Queue-Id: 7FC053272D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Mon, 16 Mar 2026 at 13:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/16/26 10:11 AM, Biju Das wrote:
> >> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).
>
> You seem to be commenting on a 0/4 cover letter here ...

Ha, the exception to the general rule ;-)

> >> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
> >> RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
> >> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
> >> all RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
> >
> > I haven't seen these patches.
>
> They are deprecated.
>
> > It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
> > covering all Renesas boards + binding change.
> Isn't this series effectively exactly that ?

I believe we still have e.g. the KSZ8041 and KSZ9031 PHY nodes to fix,
for both RZ and R-Car boards? Some of them were covered by [1] and
[2] above.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

