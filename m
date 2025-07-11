Return-Path: <linux-renesas-soc+bounces-19513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E568B01A31
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 12:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97E7A188FD78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 10:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C510288C04;
	Fri, 11 Jul 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTyk2R/A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53B146585;
	Fri, 11 Jul 2025 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231447; cv=none; b=qAo/9QxnCYKRFE8Gh621/uDNSgBNxVu/Nv6cmDu8JCiqc9oNI+QvHRLwPkGEKPhrOJJkGOzvSfYYDlxrR+aosBZjAyMHVPLgm3a/7NmVDOvz7YlhQc/jqCOVw9TQSQB8h2eAcp+BGwTCLQb+WtV+mrcR5JSZwga6e722ruu2MRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231447; c=relaxed/simple;
	bh=uEGvEdHU3YHVHFAHSUyXTMKFtV+GvYcrRc5BebHP2fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzh/oKajtC9J446APN8NxhaONgLI9Cr+AwoRsVPrXLVXDQxM9xiQM33j9fYGE6tSfEqwU6zA2/BWLSoOaI1lWWbQSSulnQXFm8SFYvCz1XL5UpxoPZ7Vebg5vnAwDVYz1KvDNGbpQlBUohiHhfNR6zqA/FANDZddS/OCVZQNVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTyk2R/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD2DC4CEED;
	Fri, 11 Jul 2025 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752231446;
	bh=uEGvEdHU3YHVHFAHSUyXTMKFtV+GvYcrRc5BebHP2fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTyk2R/AQog2P5s+uEnb9q6grec2CCJKy49vYyy9MpvovJBKtNA0W3dTEUcPpA3mk
	 ar9ehVfPGaGOQCx/OZk/2OQrUXs2xOoJXqYHINWQdcflxKTUD/6grZvF6tHHGn5QgX
	 l40aQdHsZMU0mlUDvL9h7hhe6tq376YCKM9A0Unja9zX7VVmGYTQSo8jZIwravnaW8
	 TBcDt1kPQNl5oltze0ideyVw6Ix22gUIFo83xcz4+GaTa6BsU7X1DvQKAQcDtV1dlc
	 Wv6yDRQVN4vW1t3AHOJ/IwpXG4ppxliBdq2LGbJ7tyudcp8v2kOuIcGWQjkiwL3k5I
	 jtd41XPFVv5Tw==
Date: Fri, 11 Jul 2025 11:57:21 +0100
From: Simon Horman <horms@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <20250711105721.GU721198@horms.kernel.org>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
 <20250708104740.GF452973@horms.kernel.org>
 <TY4PR01MB142826BE20FB23122B72A96348248A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY4PR01MB142826BE20FB23122B72A96348248A@TY4PR01MB14282.jpnprd01.prod.outlook.com>

On Thu, Jul 10, 2025 at 12:36:10PM +0000, Michael Dege wrote:
> Hello Simon,
> 
> > -----Original Message-----
> > From: Simon Horman <horms@kernel.org>
> > Sent: Tuesday, July 8, 2025 12:48 PM
> > To: Michael Dege <michael.dege@renesas.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas Söderlund
> > <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew Lunn <andrew+netdev@lunn.ch>;
> > David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> > <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.org; linux-renesas-
> > soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2 switching
> >
> > On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> > > This commit adds hardware offloading for L2 switching on R-Car S4.
> > >
> > > On S4 brdev is limited to one per-device (not per port). Reasoning is
> > > that hw L2 forwarding support lacks any sort of source port based
> > > filtering, which makes it unusable to offload more than one bridge
> > > device. Either you allow hardware to forward destination MAC to a
> > > port, or you have to send it to CPU. You can't make it forward only if
> > > src and dst ports are in the same brdev.
> > >
> > > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> >
> > ...
> >
> > > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > > b/drivers/net/ethernet/renesas/rswitch_l2.c
> >
> > ...
> >
> > > +static void rswitch_update_offload_brdev(struct rswitch_private *priv,
> > > +                                    bool force_update_l2_offload)
> > > +{
> > > +   struct net_device *offload_brdev = NULL;
> > > +   struct rswitch_device *rdev, *rdev2;
> > > +
> > > +   rswitch_for_all_ports(priv, rdev) {
> > > +           if (!rdev->brdev)
> > > +                   continue;
> > > +           rswitch_for_all_ports(priv, rdev2) {
> > > +                   if (rdev2 == rdev)
> > > +                           break;
> > > +                   if (rdev2->brdev == rdev->brdev) {
> > > +                           offload_brdev = rdev->brdev;
> > > +                           break;
> > > +                   }
> > > +           }
> > > +           if (offload_brdev)
> > > +                   break;
> > > +   }
> > > +
> > > +   if (offload_brdev == priv->offload_brdev) {
> > > +           if (offload_brdev && force_update_l2_offload)
> > > +                   rswitch_update_l2_offload(priv);
> > > +           return;
> > > +   }
> > > +
> > > +   if (offload_brdev && !priv->offload_brdev)
> > > +           dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> > > +                   netdev_name(offload_brdev));
> > > +   else if (!offload_brdev && priv->offload_brdev)
> > > +           dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> > > +                   netdev_name(priv->offload_brdev));
> > > +   else
> > > +           dev_dbg(&priv->pdev->dev,
> > > +                   "changing l2 offload from %s to %s\n",
> > > +                   netdev_name(priv->offload_brdev),
> > > +                   netdev_name(offload_brdev));
> >
> > Smatch flags a false-positive about possible NULL references by the
> > netdev_name() calls on the line above.
> >
> > Due to the previous if statement it seems to me that cannot occur.
> > But it did take me a few moments to convince myself of that.
> >
> > So while I don't think we should write our code to static analysis tooling.
> > I did play around a bit to see if I could come up with something that is both easier on the eyes and
> > keeps Smatch happy.
> >
> > Perhaps it isn't easier on the eyes, but rather I'm just more familiar with the code now. But in any
> > case, I'm sharing what I came up with in case it is useful. (Compile tested only!).
> >
> >
> >         if (!offload_brdev && !priv->offload_brdev)
> >                 return;
> >
> >         if (!priv->offload_brdev)
> >                 dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> >                         netdev_name(offload_brdev));
> >         else if (!offload_brdev)
> >                 dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> >                         netdev_name(priv->offload_brdev));
> >         else if (offload_brdev != priv->offload_brdev)
> >                 dev_dbg(&priv->pdev->dev,
> >                         "changing l2 offload from %s to %s\n",
> >                         netdev_name(priv->offload_brdev),
> >                         netdev_name(offload_brdev));
> >         else if (!force_update_l2_offload)
> >                 return;
> >
> 
> I updated the code, I hope it is OK, because I had to do it differently from your suggestion, because
> not all cases worked as expected.
> 
> The reworked code is tested.

Thanks. FWIIW, Smatch still complains.

But if your code is correct and tested, then I think we should not
update it a 2nd time to make the tooling happy.

