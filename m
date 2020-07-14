Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC42F21EC3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 11:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgGNJJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 05:09:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgGNJJI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 05:09:08 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 976E1564;
        Tue, 14 Jul 2020 11:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594717744;
        bh=//1b9osK9E4y7hYQzJZoWg5duHuUGI5xriRoSy6fUck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cBCLOo5M1RrcW2I6JSn2HS6uHc9P569reDii1gdQCxWoSm5XGTLeFMwqdZBHloAVc
         dua0uxr8QArwxIopBlqcKeQTDgpqZw8s/DtS7bZ74QRom1g0ihry5iBnHAryXqVGh4
         x91+kqydpy+dlDGSWbtuFDFdswzMp37/DAMdEc08=
Date:   Tue, 14 Jul 2020 12:08:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [vsp-tests] [PATCH 1/2] Add license and copyright information
Message-ID: <20200714090858.GB6095@pendragon.ideasonboard.com>
References: <20200713230808.2570-1-laurent.pinchart@ideasonboard.com>
 <ddd566c7-7216-574b-26cd-d6ed6f02e6d3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddd566c7-7216-574b-26cd-d6ed6f02e6d3@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 14, 2020 at 08:50:13AM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 14/07/2020 00:08, Laurent Pinchart wrote:
> > Add SPDX tags to describe license and copyright information to all files
> > in the repository.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Makefile                    | 2 ++
> >  README                      | 3 +++
> >  data/Makefile               | 2 ++
> >  data/frames/.gitignore      | 2 ++
> >  data/frames/Makefile        | 2 ++
> >  data/frames/gen-lut.py      | 2 ++
> >  scripts/Makefile            | 2 ++
> >  scripts/bin2png.sh          | 2 ++
> >  scripts/histo2png.py        | 2 ++
> >  scripts/logger.sh           | 2 ++
> >  scripts/vsp-lib.sh          | 2 ++
> >  scripts/vsp-tests.sh        | 2 ++
> >  src/.gitignore              | 2 ++
> >  src/Makefile                | 2 ++
> >  tests/Makefile              | 2 ++
> >  tests/vsp-unit-test-0000.sh | 2 ++
> >  tests/vsp-unit-test-0001.sh | 2 ++
> >  tests/vsp-unit-test-0002.sh | 2 ++
> >  tests/vsp-unit-test-0003.sh | 2 ++
> >  tests/vsp-unit-test-0004.sh | 2 ++
> >  tests/vsp-unit-test-0005.sh | 2 ++
> >  tests/vsp-unit-test-0006.sh | 2 ++
> >  tests/vsp-unit-test-0007.sh | 2 ++
> >  tests/vsp-unit-test-0008.sh | 2 ++
> >  tests/vsp-unit-test-0009.sh | 2 ++
> >  tests/vsp-unit-test-0010.sh | 2 ++
> >  tests/vsp-unit-test-0011.sh | 2 ++
> >  tests/vsp-unit-test-0012.sh | 2 ++
> >  tests/vsp-unit-test-0013.sh | 2 ++
> >  tests/vsp-unit-test-0014.sh | 2 ++
> >  tests/vsp-unit-test-0015.sh | 2 ++
> >  tests/vsp-unit-test-0016.sh | 2 ++
> >  tests/vsp-unit-test-0017.sh | 2 ++
> >  tests/vsp-unit-test-0018.sh | 2 ++
> >  tests/vsp-unit-test-0019.sh | 2 ++
> >  tests/vsp-unit-test-0020.sh | 2 ++
> >  tests/vsp-unit-test-0021.sh | 2 ++
> >  tests/vsp-unit-test-0022.sh | 2 ++
> >  tests/vsp-unit-test-0023.sh | 2 ++
> >  tests/vsp-unit-test-0024.sh | 2 ++
> >  tests/vsp-unit-test-0025.sh | 2 ++
> >  41 files changed, 83 insertions(+)
> >  mode change 100755 => 100644 scripts/bin2png.sh
> >  mode change 100755 => 100644 scripts/histo2png.py
> >  mode change 100755 => 100644 scripts/logger.sh
> >  mode change 100755 => 100644 scripts/vsp-lib.sh
> >  mode change 100755 => 100644 scripts/vsp-tests.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0000.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0001.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0002.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0003.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0004.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0005.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0006.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0007.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0008.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0009.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0010.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0011.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0012.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0013.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0014.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0015.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0016.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0017.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0018.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0019.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0020.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0021.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0022.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0023.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0024.sh
> >  mode change 100755 => 100644 tests/vsp-unit-test-0025.sh
> 
> Have you done all this intentionally? or is this a side effect of some
> script?
> 
> It's not mentioned at all in the commit message.

Oops, it's definitely a side effect. I'll fix it, thank you for noticing
it.

> I assume the +x bit will get (re)set on install?
> 
> 
> Though I kind of which we didn't have to have an install phase to be
> able to run tests, but it's not that big a deal.
> 
> --
> 
> For the copyright changes below:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > diff --git a/Makefile b/Makefile
> > index a1040781421a..4d311e1b84a9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SUBDIRS=data scripts src tests
> >  
> >  recursive=all clean install
> > diff --git a/README b/README
> > index 0d5a6967d7f5..e45d03a0e944 100644
> > --- a/README
> > +++ b/README
> > @@ -1,3 +1,6 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-4.0
> > +.. SPDX-FileCopyrightText: 2016-2019 Renesas Electronics Corporation
> > +
> >  vsp-tests
> >  ---------
> >  
> > diff --git a/data/Makefile b/data/Makefile
> > index 768a3463a81c..a65b5bcdc4e4 100644
> > --- a/data/Makefile
> > +++ b/data/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SUBDIRS=frames
> >  
> >  recursive=all clean install
> > diff --git a/data/frames/.gitignore b/data/frames/.gitignore
> > index a8a0dcec4472..2c0a1ff3d654 100644
> > --- a/data/frames/.gitignore
> > +++ b/data/frames/.gitignore
> > @@ -1 +1,3 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  *.bin
> > diff --git a/data/frames/Makefile b/data/frames/Makefile
> > index 37c284f7be93..026cbdd53eed 100644
> > --- a/data/frames/Makefile
> > +++ b/data/frames/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  frames=$(patsubst %.pnm.gz,%.pnm,$(wildcard *.pnm.gz))
> >  
> >  all:
> > diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
> > index f180ad6dfc7f..07889b11f4ac 100755
> > --- a/data/frames/gen-lut.py
> > +++ b/data/frames/gen-lut.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
> >  
> >  import math
> >  import sys
> > diff --git a/scripts/Makefile b/scripts/Makefile
> > index 6586b2989aed..6511c3c61ebf 100644
> > --- a/scripts/Makefile
> > +++ b/scripts/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SCRIPTS=$(wildcard *.sh)
> >  
> >  all:
> > diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
> > old mode 100755
> > new mode 100644
> > index 6422ee51bc33..d231d192e772
> > --- a/scripts/bin2png.sh
> > +++ b/scripts/bin2png.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  FILE=${1:-.}
> >  
> > diff --git a/scripts/histo2png.py b/scripts/histo2png.py
> > old mode 100755
> > new mode 100644
> > index ff1da21e1ab1..aef236343f6f
> > --- a/scripts/histo2png.py
> > +++ b/scripts/histo2png.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
> >  
> >  import matplotlib.pyplot as plt
> >  import struct
> > diff --git a/scripts/logger.sh b/scripts/logger.sh
> > old mode 100755
> > new mode 100644
> > index 8412b0ba9a08..97e1f582da2b
> > --- a/scripts/logger.sh
> > +++ b/scripts/logger.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
> >  
> >  now() {
> >  	awk '/^now/ {time=$3; printf("[%u.%06u]", time / 1000000000, (time % 1000000000) / 1000) ; exit}' /proc/timer_list
> > diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> > old mode 100755
> > new mode 100644
> > index c0eb1ca4774c..a8898e80a879
> > --- a/scripts/vsp-lib.sh
> > +++ b/scripts/vsp-lib.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  genimage='./gen-image'
> >  mediactl='media-ctl'
> > diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
> > old mode 100755
> > new mode 100644
> > index 1ed81713e5c5..e6cae04ebf0b
> > --- a/scripts/vsp-tests.sh
> > +++ b/scripts/vsp-tests.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  ##
> >  ## VSP Tests runner
> > diff --git a/src/.gitignore b/src/.gitignore
> > index 0c9be8665c9f..d42c924f0422 100644
> > --- a/src/.gitignore
> > +++ b/src/.gitignore
> > @@ -1,2 +1,4 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  *.o
> >  gen-image
> > diff --git a/src/Makefile b/src/Makefile
> > index 564ee24df1d3..d7f901f58be6 100644
> > --- a/src/Makefile
> > +++ b/src/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  CROSS_COMPILE ?=
> >  
> >  CC	:= $(CROSS_COMPILE)gcc
> > diff --git a/tests/Makefile b/tests/Makefile
> > index 6586b2989aed..6511c3c61ebf 100644
> > --- a/tests/Makefile
> > +++ b/tests/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SCRIPTS=$(wildcard *.sh)
> >  
> >  all:
> > diff --git a/tests/vsp-unit-test-0000.sh b/tests/vsp-unit-test-0000.sh
> > old mode 100755
> > new mode 100644
> > index 5f40af7f87d1..0815037a52f4
> > --- a/tests/vsp-unit-test-0000.sh
> > +++ b/tests/vsp-unit-test-0000.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2018 Renesas Electronics Corporation
> >  
> >  # Report testing conditions
> >  
> > diff --git a/tests/vsp-unit-test-0001.sh b/tests/vsp-unit-test-0001.sh
> > old mode 100755
> > new mode 100644
> > index 746e652418ff..6e91ca665473
> > --- a/tests/vsp-unit-test-0001.sh
> > +++ b/tests/vsp-unit-test-0001.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test WPF packing in RGB mode. Use a RPF -> WPF pipeline with a fixed ARGB32
> > diff --git a/tests/vsp-unit-test-0002.sh b/tests/vsp-unit-test-0002.sh
> > old mode 100755
> > new mode 100644
> > index 1a617a8b4d4d..65af446220fd
> > --- a/tests/vsp-unit-test-0002.sh
> > +++ b/tests/vsp-unit-test-0002.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test WPF packing in YUV mode. Use a RPF -> WPF pipeline with a fixed YUYV
> > diff --git a/tests/vsp-unit-test-0003.sh b/tests/vsp-unit-test-0003.sh
> > old mode 100755
> > new mode 100644
> > index 41c40b9ae1fb..0c83bdccd436
> > --- a/tests/vsp-unit-test-0003.sh
> > +++ b/tests/vsp-unit-test-0003.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test downscaling and upscaling in RGB and YUV modes. Use a RPF -> UDS -> WPF
> > diff --git a/tests/vsp-unit-test-0004.sh b/tests/vsp-unit-test-0004.sh
> > old mode 100755
> > new mode 100644
> > index 69b875bbd81c..1f064def49f6
> > --- a/tests/vsp-unit-test-0004.sh
> > +++ b/tests/vsp-unit-test-0004.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test 1D histogram generation. Use a RPF -> WPF pipeline with the HGO hooked
> > diff --git a/tests/vsp-unit-test-0005.sh b/tests/vsp-unit-test-0005.sh
> > old mode 100755
> > new mode 100644
> > index 04c79c4b321c..a132cbfd9da4
> > --- a/tests/vsp-unit-test-0005.sh
> > +++ b/tests/vsp-unit-test-0005.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RPF -> WPF with all RPF instances in sequence. The format doesn't matter
> > diff --git a/tests/vsp-unit-test-0006.sh b/tests/vsp-unit-test-0006.sh
> > old mode 100755
> > new mode 100644
> > index 8781498d3bcd..1191e2643ca5
> > --- a/tests/vsp-unit-test-0006.sh
> > +++ b/tests/vsp-unit-test-0006.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test invalid pipelines, without an RPF or without a WPF.
> > diff --git a/tests/vsp-unit-test-0007.sh b/tests/vsp-unit-test-0007.sh
> > old mode 100755
> > new mode 100644
> > index d5ba44c2ab37..2d96e3ba53e7
> > --- a/tests/vsp-unit-test-0007.sh
> > +++ b/tests/vsp-unit-test-0007.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test composition through the BRU in RGB and YUV formats.
> > diff --git a/tests/vsp-unit-test-0008.sh b/tests/vsp-unit-test-0008.sh
> > old mode 100755
> > new mode 100644
> > index 717560f8cfae..7532d114fc00
> > --- a/tests/vsp-unit-test-0008.sh
> > +++ b/tests/vsp-unit-test-0008.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test downscaling and upscaling in RGB and YUV modes with a BRU inserted in
> > diff --git a/tests/vsp-unit-test-0009.sh b/tests/vsp-unit-test-0009.sh
> > old mode 100755
> > new mode 100644
> > index 8814665b01f8..8fa2014f6d59
> > --- a/tests/vsp-unit-test-0009.sh
> > +++ b/tests/vsp-unit-test-0009.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RPF -> WPF with all WPF instances in sequence. The format doesn't matter
> > diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
> > old mode 100755
> > new mode 100644
> > index 268b1c44b440..1486fb871eaa
> > --- a/tests/vsp-unit-test-0010.sh
> > +++ b/tests/vsp-unit-test-0010.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test CLU and LUT in RGB and YUV modes. Use a RPF -> CLU -> WPF and
> > diff --git a/tests/vsp-unit-test-0011.sh b/tests/vsp-unit-test-0011.sh
> > old mode 100755
> > new mode 100644
> > index 6d24477a18cf..ada878c1cdb7
> > --- a/tests/vsp-unit-test-0011.sh
> > +++ b/tests/vsp-unit-test-0011.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test all combinations of horizontal flip, vertical flip and rotation on WPF.0.
> > diff --git a/tests/vsp-unit-test-0012.sh b/tests/vsp-unit-test-0012.sh
> > old mode 100755
> > new mode 100644
> > index 4c843cdd880d..ac9a38ec6233
> > --- a/tests/vsp-unit-test-0012.sh
> > +++ b/tests/vsp-unit-test-0012.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test runtime modification of horizontal and vertical flipping on WPF.0.
> > diff --git a/tests/vsp-unit-test-0013.sh b/tests/vsp-unit-test-0013.sh
> > old mode 100755
> > new mode 100644
> > index ac05d904df3e..9faf5817d607
> > --- a/tests/vsp-unit-test-0013.sh
> > +++ b/tests/vsp-unit-test-0013.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RPF unpacking in RGB mode. Use a RPF -> WPF pipeline with a fixed ARGB32
> > diff --git a/tests/vsp-unit-test-0014.sh b/tests/vsp-unit-test-0014.sh
> > old mode 100755
> > new mode 100644
> > index 6d07bb2af34b..4d749d78da59
> > --- a/tests/vsp-unit-test-0014.sh
> > +++ b/tests/vsp-unit-test-0014.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RPF unpacking in RGB mode. Use a RPF -> WPF pipeline with a fixed YUV444M
> > diff --git a/tests/vsp-unit-test-0015.sh b/tests/vsp-unit-test-0015.sh
> > old mode 100755
> > new mode 100644
> > index 831817895589..727874291710
> > --- a/tests/vsp-unit-test-0015.sh
> > +++ b/tests/vsp-unit-test-0015.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test SRU upscaling in RGB and YUV modes.
> > diff --git a/tests/vsp-unit-test-0016.sh b/tests/vsp-unit-test-0016.sh
> > old mode 100755
> > new mode 100644
> > index 69a1099cd375..89379634d584
> > --- a/tests/vsp-unit-test-0016.sh
> > +++ b/tests/vsp-unit-test-0016.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test all combinations of horizontal flip, vertical flip and rotation on WPF.0
> > diff --git a/tests/vsp-unit-test-0017.sh b/tests/vsp-unit-test-0017.sh
> > old mode 100755
> > new mode 100644
> > index 26cf4af68fca..037e2ba300b1
> > --- a/tests/vsp-unit-test-0017.sh
> > +++ b/tests/vsp-unit-test-0017.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RGB to HSV conversion: Use a RPF -> HST -> WPF pipeline with a fixed
> > diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
> > old mode 100755
> > new mode 100644
> > index 015555cd2f0f..77cf936770d2
> > --- a/tests/vsp-unit-test-0018.sh
> > +++ b/tests/vsp-unit-test-0018.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test RPF crop using RGB. Use a RPF -> WPF pipeline, passing a selection of
> > diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
> > old mode 100755
> > new mode 100644
> > index ab20733ce0ac..06d233992980
> > --- a/tests/vsp-unit-test-0019.sh
> > +++ b/tests/vsp-unit-test-0019.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test power-management suspend/resume whilst pipelines are idle
> > diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> > old mode 100755
> > new mode 100644
> > index c662466b76de..c322da585eb1
> > --- a/tests/vsp-unit-test-0020.sh
> > +++ b/tests/vsp-unit-test-0020.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2018 Renesas Electronics Corporation
> >  
> >  #
> >  # Test power-management suspend/resume whilst pipelines are active
> > diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
> > old mode 100755
> > new mode 100644
> > index 5e05faac0f5a..df4a4a452598
> > --- a/tests/vsp-unit-test-0021.sh
> > +++ b/tests/vsp-unit-test-0021.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test active pipeline, with high load on CPU/Memory/IO using 'stress'
> > diff --git a/tests/vsp-unit-test-0022.sh b/tests/vsp-unit-test-0022.sh
> > old mode 100755
> > new mode 100644
> > index fd9ea3258de2..dc1e6986650c
> > --- a/tests/vsp-unit-test-0022.sh
> > +++ b/tests/vsp-unit-test-0022.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test active pipeline, with high load on CPU/Memory/IO using 'stress'
> > diff --git a/tests/vsp-unit-test-0023.sh b/tests/vsp-unit-test-0023.sh
> > old mode 100755
> > new mode 100644
> > index 371fbea84f3e..1eff34ef40b6
> > --- a/tests/vsp-unit-test-0023.sh
> > +++ b/tests/vsp-unit-test-0023.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test 2D histogram generation. Use a RPF -> HST -> HSI -> WPF pipeline
> > diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
> > old mode 100755
> > new mode 100644
> > index a8f4144cbffc..d9b70b11225e
> > --- a/tests/vsp-unit-test-0024.sh
> > +++ b/tests/vsp-unit-test-0024.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> >  
> >  #
> >  # Test composition through the BRS in RGB and YUV formats.
> > diff --git a/tests/vsp-unit-test-0025.sh b/tests/vsp-unit-test-0025.sh
> > old mode 100755
> > new mode 100644
> > index b0216df54f98..db10ebe3f4b6
> > --- a/tests/vsp-unit-test-0025.sh
> > +++ b/tests/vsp-unit-test-0025.sh
> > @@ -1,4 +1,6 @@
> >  #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2018 Renesas Electronics Corporation
> >  
> >  #
> >  # Test pipelines which have a single pixel dimension. Use a RPF -> WPF

-- 
Regards,

Laurent Pinchart
