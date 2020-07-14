Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01E721EA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 09:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgGNHuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 03:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgGNHuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 03:50:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FCAC061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2020 00:50:23 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 238C5564;
        Tue, 14 Jul 2020 09:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594713020;
        bh=D3q7yQi4QSx71IZZc8PSENZFNCXZhy2t2FEFRZDsroE=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=F8mff2LAXU6NEGHpaSZJOVdBmSC35w5F8L1ZAANrtDOPCLHHq6tImnm1WRb6K4olg
         tduq/32TyyibkEMsVaZHC5PrQw2CBw1ySAczIkm4wKafpzOBp+tpM6MdZvkAe7LrCW
         tTY8JObbeISyA5C8brB8dzoGDUm3aroa5fE+Vs+o=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [vsp-tests] [PATCH 1/2] Add license and copyright information
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200713230808.2570-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <ddd566c7-7216-574b-26cd-d6ed6f02e6d3@ideasonboard.com>
Date:   Tue, 14 Jul 2020 08:50:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713230808.2570-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 14/07/2020 00:08, Laurent Pinchart wrote:
> Add SPDX tags to describe license and copyright information to all files
> in the repository.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Makefile                    | 2 ++
>  README                      | 3 +++
>  data/Makefile               | 2 ++
>  data/frames/.gitignore      | 2 ++
>  data/frames/Makefile        | 2 ++
>  data/frames/gen-lut.py      | 2 ++
>  scripts/Makefile            | 2 ++
>  scripts/bin2png.sh          | 2 ++
>  scripts/histo2png.py        | 2 ++
>  scripts/logger.sh           | 2 ++
>  scripts/vsp-lib.sh          | 2 ++
>  scripts/vsp-tests.sh        | 2 ++
>  src/.gitignore              | 2 ++
>  src/Makefile                | 2 ++
>  tests/Makefile              | 2 ++
>  tests/vsp-unit-test-0000.sh | 2 ++
>  tests/vsp-unit-test-0001.sh | 2 ++
>  tests/vsp-unit-test-0002.sh | 2 ++
>  tests/vsp-unit-test-0003.sh | 2 ++
>  tests/vsp-unit-test-0004.sh | 2 ++
>  tests/vsp-unit-test-0005.sh | 2 ++
>  tests/vsp-unit-test-0006.sh | 2 ++
>  tests/vsp-unit-test-0007.sh | 2 ++
>  tests/vsp-unit-test-0008.sh | 2 ++
>  tests/vsp-unit-test-0009.sh | 2 ++
>  tests/vsp-unit-test-0010.sh | 2 ++
>  tests/vsp-unit-test-0011.sh | 2 ++
>  tests/vsp-unit-test-0012.sh | 2 ++
>  tests/vsp-unit-test-0013.sh | 2 ++
>  tests/vsp-unit-test-0014.sh | 2 ++
>  tests/vsp-unit-test-0015.sh | 2 ++
>  tests/vsp-unit-test-0016.sh | 2 ++
>  tests/vsp-unit-test-0017.sh | 2 ++
>  tests/vsp-unit-test-0018.sh | 2 ++
>  tests/vsp-unit-test-0019.sh | 2 ++
>  tests/vsp-unit-test-0020.sh | 2 ++
>  tests/vsp-unit-test-0021.sh | 2 ++
>  tests/vsp-unit-test-0022.sh | 2 ++
>  tests/vsp-unit-test-0023.sh | 2 ++
>  tests/vsp-unit-test-0024.sh | 2 ++
>  tests/vsp-unit-test-0025.sh | 2 ++
>  41 files changed, 83 insertions(+)
>  mode change 100755 => 100644 scripts/bin2png.sh
>  mode change 100755 => 100644 scripts/histo2png.py
>  mode change 100755 => 100644 scripts/logger.sh
>  mode change 100755 => 100644 scripts/vsp-lib.sh
>  mode change 100755 => 100644 scripts/vsp-tests.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0000.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0001.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0002.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0003.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0004.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0005.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0006.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0007.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0008.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0009.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0010.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0011.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0012.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0013.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0014.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0015.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0016.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0017.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0018.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0019.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0020.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0021.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0022.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0023.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0024.sh
>  mode change 100755 => 100644 tests/vsp-unit-test-0025.sh

Have you done all this intentionally? or is this a side effect of some
script?

It's not mentioned at all in the commit message.

I assume the +x bit will get (re)set on install?


Though I kind of which we didn't have to have an install phase to be
able to run tests, but it's not that big a deal.

--

For the copyright changes below:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> diff --git a/Makefile b/Makefile
> index a1040781421a..4d311e1b84a9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SUBDIRS=data scripts src tests
>  
>  recursive=all clean install
> diff --git a/README b/README
> index 0d5a6967d7f5..e45d03a0e944 100644
> --- a/README
> +++ b/README
> @@ -1,3 +1,6 @@
> +.. SPDX-License-Identifier: CC-BY-SA-4.0
> +.. SPDX-FileCopyrightText: 2016-2019 Renesas Electronics Corporation
> +
>  vsp-tests
>  ---------
>  
> diff --git a/data/Makefile b/data/Makefile
> index 768a3463a81c..a65b5bcdc4e4 100644
> --- a/data/Makefile
> +++ b/data/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SUBDIRS=frames
>  
>  recursive=all clean install
> diff --git a/data/frames/.gitignore b/data/frames/.gitignore
> index a8a0dcec4472..2c0a1ff3d654 100644
> --- a/data/frames/.gitignore
> +++ b/data/frames/.gitignore
> @@ -1 +1,3 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  *.bin
> diff --git a/data/frames/Makefile b/data/frames/Makefile
> index 37c284f7be93..026cbdd53eed 100644
> --- a/data/frames/Makefile
> +++ b/data/frames/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  frames=$(patsubst %.pnm.gz,%.pnm,$(wildcard *.pnm.gz))
>  
>  all:
> diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
> index f180ad6dfc7f..07889b11f4ac 100755
> --- a/data/frames/gen-lut.py
> +++ b/data/frames/gen-lut.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
>  
>  import math
>  import sys
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 6586b2989aed..6511c3c61ebf 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SCRIPTS=$(wildcard *.sh)
>  
>  all:
> diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
> old mode 100755
> new mode 100644
> index 6422ee51bc33..d231d192e772
> --- a/scripts/bin2png.sh
> +++ b/scripts/bin2png.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  FILE=${1:-.}
>  
> diff --git a/scripts/histo2png.py b/scripts/histo2png.py
> old mode 100755
> new mode 100644
> index ff1da21e1ab1..aef236343f6f
> --- a/scripts/histo2png.py
> +++ b/scripts/histo2png.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
>  
>  import matplotlib.pyplot as plt
>  import struct
> diff --git a/scripts/logger.sh b/scripts/logger.sh
> old mode 100755
> new mode 100644
> index 8412b0ba9a08..97e1f582da2b
> --- a/scripts/logger.sh
> +++ b/scripts/logger.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
>  
>  now() {
>  	awk '/^now/ {time=$3; printf("[%u.%06u]", time / 1000000000, (time % 1000000000) / 1000) ; exit}' /proc/timer_list
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> old mode 100755
> new mode 100644
> index c0eb1ca4774c..a8898e80a879
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  genimage='./gen-image'
>  mediactl='media-ctl'
> diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
> old mode 100755
> new mode 100644
> index 1ed81713e5c5..e6cae04ebf0b
> --- a/scripts/vsp-tests.sh
> +++ b/scripts/vsp-tests.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  ##
>  ## VSP Tests runner
> diff --git a/src/.gitignore b/src/.gitignore
> index 0c9be8665c9f..d42c924f0422 100644
> --- a/src/.gitignore
> +++ b/src/.gitignore
> @@ -1,2 +1,4 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  *.o
>  gen-image
> diff --git a/src/Makefile b/src/Makefile
> index 564ee24df1d3..d7f901f58be6 100644
> --- a/src/Makefile
> +++ b/src/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  CROSS_COMPILE ?=
>  
>  CC	:= $(CROSS_COMPILE)gcc
> diff --git a/tests/Makefile b/tests/Makefile
> index 6586b2989aed..6511c3c61ebf 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SCRIPTS=$(wildcard *.sh)
>  
>  all:
> diff --git a/tests/vsp-unit-test-0000.sh b/tests/vsp-unit-test-0000.sh
> old mode 100755
> new mode 100644
> index 5f40af7f87d1..0815037a52f4
> --- a/tests/vsp-unit-test-0000.sh
> +++ b/tests/vsp-unit-test-0000.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2018 Renesas Electronics Corporation
>  
>  # Report testing conditions
>  
> diff --git a/tests/vsp-unit-test-0001.sh b/tests/vsp-unit-test-0001.sh
> old mode 100755
> new mode 100644
> index 746e652418ff..6e91ca665473
> --- a/tests/vsp-unit-test-0001.sh
> +++ b/tests/vsp-unit-test-0001.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test WPF packing in RGB mode. Use a RPF -> WPF pipeline with a fixed ARGB32
> diff --git a/tests/vsp-unit-test-0002.sh b/tests/vsp-unit-test-0002.sh
> old mode 100755
> new mode 100644
> index 1a617a8b4d4d..65af446220fd
> --- a/tests/vsp-unit-test-0002.sh
> +++ b/tests/vsp-unit-test-0002.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test WPF packing in YUV mode. Use a RPF -> WPF pipeline with a fixed YUYV
> diff --git a/tests/vsp-unit-test-0003.sh b/tests/vsp-unit-test-0003.sh
> old mode 100755
> new mode 100644
> index 41c40b9ae1fb..0c83bdccd436
> --- a/tests/vsp-unit-test-0003.sh
> +++ b/tests/vsp-unit-test-0003.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test downscaling and upscaling in RGB and YUV modes. Use a RPF -> UDS -> WPF
> diff --git a/tests/vsp-unit-test-0004.sh b/tests/vsp-unit-test-0004.sh
> old mode 100755
> new mode 100644
> index 69b875bbd81c..1f064def49f6
> --- a/tests/vsp-unit-test-0004.sh
> +++ b/tests/vsp-unit-test-0004.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test 1D histogram generation. Use a RPF -> WPF pipeline with the HGO hooked
> diff --git a/tests/vsp-unit-test-0005.sh b/tests/vsp-unit-test-0005.sh
> old mode 100755
> new mode 100644
> index 04c79c4b321c..a132cbfd9da4
> --- a/tests/vsp-unit-test-0005.sh
> +++ b/tests/vsp-unit-test-0005.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test RPF -> WPF with all RPF instances in sequence. The format doesn't matter
> diff --git a/tests/vsp-unit-test-0006.sh b/tests/vsp-unit-test-0006.sh
> old mode 100755
> new mode 100644
> index 8781498d3bcd..1191e2643ca5
> --- a/tests/vsp-unit-test-0006.sh
> +++ b/tests/vsp-unit-test-0006.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test invalid pipelines, without an RPF or without a WPF.
> diff --git a/tests/vsp-unit-test-0007.sh b/tests/vsp-unit-test-0007.sh
> old mode 100755
> new mode 100644
> index d5ba44c2ab37..2d96e3ba53e7
> --- a/tests/vsp-unit-test-0007.sh
> +++ b/tests/vsp-unit-test-0007.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test composition through the BRU in RGB and YUV formats.
> diff --git a/tests/vsp-unit-test-0008.sh b/tests/vsp-unit-test-0008.sh
> old mode 100755
> new mode 100644
> index 717560f8cfae..7532d114fc00
> --- a/tests/vsp-unit-test-0008.sh
> +++ b/tests/vsp-unit-test-0008.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test downscaling and upscaling in RGB and YUV modes with a BRU inserted in
> diff --git a/tests/vsp-unit-test-0009.sh b/tests/vsp-unit-test-0009.sh
> old mode 100755
> new mode 100644
> index 8814665b01f8..8fa2014f6d59
> --- a/tests/vsp-unit-test-0009.sh
> +++ b/tests/vsp-unit-test-0009.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test RPF -> WPF with all WPF instances in sequence. The format doesn't matter
> diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
> old mode 100755
> new mode 100644
> index 268b1c44b440..1486fb871eaa
> --- a/tests/vsp-unit-test-0010.sh
> +++ b/tests/vsp-unit-test-0010.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test CLU and LUT in RGB and YUV modes. Use a RPF -> CLU -> WPF and
> diff --git a/tests/vsp-unit-test-0011.sh b/tests/vsp-unit-test-0011.sh
> old mode 100755
> new mode 100644
> index 6d24477a18cf..ada878c1cdb7
> --- a/tests/vsp-unit-test-0011.sh
> +++ b/tests/vsp-unit-test-0011.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test all combinations of horizontal flip, vertical flip and rotation on WPF.0.
> diff --git a/tests/vsp-unit-test-0012.sh b/tests/vsp-unit-test-0012.sh
> old mode 100755
> new mode 100644
> index 4c843cdd880d..ac9a38ec6233
> --- a/tests/vsp-unit-test-0012.sh
> +++ b/tests/vsp-unit-test-0012.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test runtime modification of horizontal and vertical flipping on WPF.0.
> diff --git a/tests/vsp-unit-test-0013.sh b/tests/vsp-unit-test-0013.sh
> old mode 100755
> new mode 100644
> index ac05d904df3e..9faf5817d607
> --- a/tests/vsp-unit-test-0013.sh
> +++ b/tests/vsp-unit-test-0013.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test RPF unpacking in RGB mode. Use a RPF -> WPF pipeline with a fixed ARGB32
> diff --git a/tests/vsp-unit-test-0014.sh b/tests/vsp-unit-test-0014.sh
> old mode 100755
> new mode 100644
> index 6d07bb2af34b..4d749d78da59
> --- a/tests/vsp-unit-test-0014.sh
> +++ b/tests/vsp-unit-test-0014.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test RPF unpacking in RGB mode. Use a RPF -> WPF pipeline with a fixed YUV444M
> diff --git a/tests/vsp-unit-test-0015.sh b/tests/vsp-unit-test-0015.sh
> old mode 100755
> new mode 100644
> index 831817895589..727874291710
> --- a/tests/vsp-unit-test-0015.sh
> +++ b/tests/vsp-unit-test-0015.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test SRU upscaling in RGB and YUV modes.
> diff --git a/tests/vsp-unit-test-0016.sh b/tests/vsp-unit-test-0016.sh
> old mode 100755
> new mode 100644
> index 69a1099cd375..89379634d584
> --- a/tests/vsp-unit-test-0016.sh
> +++ b/tests/vsp-unit-test-0016.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test all combinations of horizontal flip, vertical flip and rotation on WPF.0
> diff --git a/tests/vsp-unit-test-0017.sh b/tests/vsp-unit-test-0017.sh
> old mode 100755
> new mode 100644
> index 26cf4af68fca..037e2ba300b1
> --- a/tests/vsp-unit-test-0017.sh
> +++ b/tests/vsp-unit-test-0017.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test RGB to HSV conversion: Use a RPF -> HST -> WPF pipeline with a fixed
> diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
> old mode 100755
> new mode 100644
> index 015555cd2f0f..77cf936770d2
> --- a/tests/vsp-unit-test-0018.sh
> +++ b/tests/vsp-unit-test-0018.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
>  
>  #
>  # Test RPF crop using RGB. Use a RPF -> WPF pipeline, passing a selection of
> diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
> old mode 100755
> new mode 100644
> index ab20733ce0ac..06d233992980
> --- a/tests/vsp-unit-test-0019.sh
> +++ b/tests/vsp-unit-test-0019.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test power-management suspend/resume whilst pipelines are idle
> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> old mode 100755
> new mode 100644
> index c662466b76de..c322da585eb1
> --- a/tests/vsp-unit-test-0020.sh
> +++ b/tests/vsp-unit-test-0020.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2018 Renesas Electronics Corporation
>  
>  #
>  # Test power-management suspend/resume whilst pipelines are active
> diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
> old mode 100755
> new mode 100644
> index 5e05faac0f5a..df4a4a452598
> --- a/tests/vsp-unit-test-0021.sh
> +++ b/tests/vsp-unit-test-0021.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
>  
>  #
>  # Test active pipeline, with high load on CPU/Memory/IO using 'stress'
> diff --git a/tests/vsp-unit-test-0022.sh b/tests/vsp-unit-test-0022.sh
> old mode 100755
> new mode 100644
> index fd9ea3258de2..dc1e6986650c
> --- a/tests/vsp-unit-test-0022.sh
> +++ b/tests/vsp-unit-test-0022.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
>  
>  #
>  # Test active pipeline, with high load on CPU/Memory/IO using 'stress'
> diff --git a/tests/vsp-unit-test-0023.sh b/tests/vsp-unit-test-0023.sh
> old mode 100755
> new mode 100644
> index 371fbea84f3e..1eff34ef40b6
> --- a/tests/vsp-unit-test-0023.sh
> +++ b/tests/vsp-unit-test-0023.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
>  
>  #
>  # Test 2D histogram generation. Use a RPF -> HST -> HSI -> WPF pipeline
> diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
> old mode 100755
> new mode 100644
> index a8f4144cbffc..d9b70b11225e
> --- a/tests/vsp-unit-test-0024.sh
> +++ b/tests/vsp-unit-test-0024.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
>  
>  #
>  # Test composition through the BRS in RGB and YUV formats.
> diff --git a/tests/vsp-unit-test-0025.sh b/tests/vsp-unit-test-0025.sh
> old mode 100755
> new mode 100644
> index b0216df54f98..db10ebe3f4b6
> --- a/tests/vsp-unit-test-0025.sh
> +++ b/tests/vsp-unit-test-0025.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2018 Renesas Electronics Corporation
>  
>  #
>  # Test pipelines which have a single pixel dimension. Use a RPF -> WPF
> 

-- 
Regards
--
Kieran
