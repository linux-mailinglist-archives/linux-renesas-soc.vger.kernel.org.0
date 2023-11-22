Return-Path: <linux-renesas-soc+bounces-123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEAF7F4B7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 16:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A007BB20E2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0069D56B87;
	Wed, 22 Nov 2023 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sQSAA2uD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B463C49D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 07:46:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56F24276;
	Wed, 22 Nov 2023 16:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700667959;
	bh=urwsb+ySe5L3TfYI5UUf9OH5BqYlaWTpMboQoZDj0/I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sQSAA2uDchio+5oI9RUSA9RUd76kRaoU9tGJqxQLluM7FiGBCUQl8C2FwWrRHsVVc
	 HwUw+du+vwXu2nyyhd2C9K9hB5Dccplo9ms9J9X4BgDhizfmn7/6KCQ0Sh5J8/YWge
	 R5r44235/tjId2CqolCh8CrYlspvpph3WYHFzsiI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170066796117.630990.8784641575188308647@ping.linuxembedded.co.uk>
References: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com> <20231114131211.24462-2-laurent.pinchart@ideasonboard.com> <170066796117.630990.8784641575188308647@ping.linuxembedded.co.uk>
Subject: Re: [vsp-tests] [PATCH v2 2/2] scripts: Take all skipped tests into account
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Wed, 22 Nov 2023 15:46:28 +0000
Message-ID: <170066798824.630990.5275330408854339373@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Kieran Bingham (2023-11-22 15:46:01)
> Quoting Laurent Pinchart (2023-11-14 13:12:11)
> > Some skipped tests print a "skip" message, while other print "skipped".
> > This leads to some of them not being counted. Standardize on "skip".
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> That's probably the easier way ;-)
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Or rather,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>=20
> > ---
> >  scripts/vsp-lib.sh   | 2 +-
> >  scripts/vsp-tests.sh | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> > index a8898e80a879..114bc7200e6e 100755
> > --- a/scripts/vsp-lib.sh
> > +++ b/scripts/vsp-lib.sh
> > @@ -1076,7 +1076,7 @@ test_init() {
> > =20
> >         if [ -z $best_mdev ] ; then
> >                 echo "No device found with feature set \`$features'" | =
./logger.sh config >> $logfile
> > -               echo "Test requires unavailable feature set \`$features=
': skipped" >&2
> > +               echo "Test requires unavailable feature set \`$features=
': skip" >&2
> >                 exit 1
> >         fi
> > =20
> > diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
> > index 7805f1b7de1c..13e7ba4410b5 100755
> > --- a/scripts/vsp-tests.sh
> > +++ b/scripts/vsp-tests.sh
> > @@ -31,16 +31,16 @@ run_test() {
> >         for line in $output ; do
> >                 local pass=3D0
> >                 local fail=3D0
> > -               local skipped=3D0
> > +               local skip=3D0
> > =20
> >                 (echo "$line" | grep -q ': fail$') && fail=3D1
> >                 (echo "$line" | grep -q ': pass$') && pass=3D1
> > -               (echo "$line" | grep -q ': skipped$') && skipped=3D1
> > +               (echo "$line" | grep -q ': skip$') && skip=3D1
> > =20
> >                 num_fail=3D$((num_fail+fail))
> >                 num_pass=3D$((num_pass+pass))
> > -               num_skipped=3D$((num_skipped+skipped))
> > -               num_test=3D$((num_test+pass+fail+skipped))
> > +               num_skip=3D$((num_skip+skip))
> > +               num_test=3D$((num_test+pass+fail+skip))
> >         done
> > =20
> >         if [ $(ls *.bin 2>/dev/null | wc -l) !=3D 0 ] ; then
> > --=20
> > Regards,
> >=20
> > Laurent Pinchart
> >

