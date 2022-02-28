Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932C24C6CBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 13:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiB1Mih (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 07:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiB1Mih (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 07:38:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9281192B1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 04:37:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A089B478;
        Mon, 28 Feb 2022 13:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646051875;
        bh=tQGQt51s1AOODkyrtCCTA/e60tu84r4J6dAqwujHU0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o0JGmK0bpsCQbW6VyE9InkXmAhxg3Mi7TdgAfjecmX2FpmNsCQAPmPo4FTEeQ8C5D
         e7o94MWlhOb8T6opIGGch4Vh9gDkchJgKtjzT7wB1T4/jPyg4VDp4C1GLY2H3CLcLY
         eOIBsCSjfFk3mCVPub/e3Wv4SxkehbEVB2DgZxX4=
Date:   Mon, 28 Feb 2022 14:37:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] tests: Add RPF cropping test for YUV formats
Message-ID: <YhzCGAETHTH+V79d@pendragon.ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
 <20220228112901.21289-3-laurent.pinchart@ideasonboard.com>
 <164605135487.2091767.11542421263644129120@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164605135487.2091767.11542421263644129120@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Feb 28, 2022 at 12:29:14PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-02-28 11:29:01)
> > YUV formats can be subsampled, which interact with cropping. Add a test
> > to verify that the VSP driver handles this correctly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  tests/vsp-unit-test-0027.sh | 46 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100755 tests/vsp-unit-test-0027.sh
> > 
> > diff --git a/tests/vsp-unit-test-0027.sh b/tests/vsp-unit-test-0027.sh
> > new file mode 100755
> > index 000000000000..8be8ae736375
> > --- /dev/null
> > +++ b/tests/vsp-unit-test-0027.sh
> > @@ -0,0 +1,46 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2022 Renesas Electronics Corporation
> > +
> > +#
> > +# Test RPF crop using multiplanar YUV formats, test buffer offset calculation
> > +# with subsampling. Use a RPF -> WPF pipeline, passing a selection of cropping
> > +# windows.
> > +#
> > +
> > +. ./vsp-lib.sh
> > +
> > +features="rpf.0 wpf.0"
> > +crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
> 
> I was expecting to see more strenuous variations here. Are the crops
> limited for now ?

I've copied these values from the RGB crop tests. We can add more crop
rectangles if there are specific items that need to be tested.

> Does this already highlight any failures in the
> driver? or do these pass?

The test fails, the fix is available at
https://lore.kernel.org/linux-media/20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com/T/#u

> Anyway, Extending the tests is beneficial, even if this can be further
> extended.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +formats="NV12M NV16M YUV420M YUV422M YUV444M"
> > +
> > +test_rpf_cropping() {
> > +       local format=$1
> > +       local crop=$2
> > +
> > +       test_start "RPF crop from $crop in $format"
> > +
> > +       pipe_configure rpf-wpf 0 0
> > +       format_configure rpf-wpf 0 0 $format 1024x768 YUV444M --rpfcrop=$crop
> > +
> > +       vsp_runner rpf.0 &
> > +       vsp_runner wpf.0
> > +
> > +       local result=$(compare_frames crop=${crop})
> > +
> > +       test_complete $result
> > +}
> > +
> > +test_main() {
> > +       local crop
> > +       local format
> > +
> > +       for format in $formats ; do
> > +               for crop in $crops ; do
> > +                       test_rpf_cropping $format $crop
> > +               done
> > +       done
> > +}
> > +
> > +test_init $0 "$features"
> > +test_run

-- 
Regards,

Laurent Pinchart
