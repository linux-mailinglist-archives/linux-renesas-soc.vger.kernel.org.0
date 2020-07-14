Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1977821EC39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 11:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgGNJHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 05:07:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgGNJHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 05:07:47 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09BD564;
        Tue, 14 Jul 2020 11:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594717664;
        bh=dRaEo4Cfn5pUn4gbkT5ixi0U0Ugd8bkqvS0VBNVPzgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IzQ48isE6jPmcYytYZMubt/knwbvFiw0DnXN4WS6x+YoFE+Khddjid1yuBalX6dAL
         +TkFonzmrITF0X4Oci6OP0zBGbKoBF5kM9azEIVdC3ZXcBgtzidfTeKe7V9bJ4FoZ9
         m7K+byyF6aKc05A0Eruct/eu4tW4k2nP+EDzCbCU=
Date:   Tue, 14 Jul 2020 12:07:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [kms-test] [PATCH] Add license and copyright information
Message-ID: <20200714090738.GA6095@pendragon.ideasonboard.com>
References: <20200713230438.2087-1-laurent.pinchart@ideasonboard.com>
 <d9a71f52-be59-8949-0203-5e7671419bc7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d9a71f52-be59-8949-0203-5e7671419bc7@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Tue, Jul 14, 2020 at 08:42:44AM +0100, Kieran Bingham wrote:
> On 14/07/2020 00:04, Laurent Pinchart wrote:
> > Add SPDX tags to describe license and copyright information to all files
> > in the repository.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Makefile                         | 2 ++
> >  README                           | 3 +++
> >  tests/Makefile                   | 2 ++
> >  tests/kms-test-allplanes.py      | 2 ++
> >  tests/kms-test-brxalloc.py       | 2 ++
> >  tests/kms-test-connectors.py     | 2 ++
> >  tests/kms-test-crc.py            | 2 ++
> >  tests/kms-test-formats.py        | 2 ++
> >  tests/kms-test-legacy-modeset.py | 2 ++
> >  tests/kms-test-modes.py          | 2 ++
> >  tests/kms-test-modeset.py        | 2 ++
> >  tests/kms-test-pageflip.py       | 2 ++
> >  tests/kms-test-planeposition.py  | 2 ++
> >  tests/kms-test-routing.py        | 2 ++
> >  tests/kmstest.py                 | 2 ++
> >  15 files changed, 31 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 3fe6ed9604bc..1f0da15546b8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SUBDIRS=tests
> >  
> >  recursive=all clean install
> > diff --git a/README b/README
> > index 69a3bc5eef6c..7f770d4170a3 100644
> > --- a/README
> > +++ b/README
> > @@ -1,3 +1,6 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-4.0
> > +.. SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> 
> As you are only now adding this, wouldn't you make this 2020 ?
> Or have you chosen the date the file was created?
> 
> 
> Hrm, ok, so every addition has different values, so I can assume you are
> taking the years in which modifications have been made to the file.

Correct. Sorry for not mentioning that in the patch.

> Seems extraneous, but it's fine.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +
> >  du-tests
> >  --------
> >  
> > diff --git a/tests/Makefile b/tests/Makefile
> > index 521761af28cf..0a921e5f56cd 100644
> > --- a/tests/Makefile
> > +++ b/tests/Makefile
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: CC0-1.0
> > +
> >  SCRIPTS=$(wildcard *.py)
> >  
> >  all:
> > diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> > index ca7baa07af42..d88326293782 100755
> > --- a/tests/kms-test-allplanes.py
> > +++ b/tests/kms-test-allplanes.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> > index a0ae46a8b53e..dbdc78946b04 100755
> > --- a/tests/kms-test-brxalloc.py
> > +++ b/tests/kms-test-brxalloc.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
> > index 25fc5dc8f60e..4c58b99f8fbf 100755
> > --- a/tests/kms-test-connectors.py
> > +++ b/tests/kms-test-connectors.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
> > index e0e0eabd9950..d936d1d4fb90 100755
> > --- a/tests/kms-test-crc.py
> > +++ b/tests/kms-test-crc.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
> > index 15e6f591aea9..77c9fe775a7c 100755
> > --- a/tests/kms-test-formats.py
> > +++ b/tests/kms-test-formats.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
> > index 17a81792a2b8..4b5605345391 100755
> > --- a/tests/kms-test-legacy-modeset.py
> > +++ b/tests/kms-test-legacy-modeset.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
> > index 82a1a3b21e93..b298a19beedf 100755
> > --- a/tests/kms-test-modes.py
> > +++ b/tests/kms-test-modes.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
> > index 224b39143a8e..0dbe67fb2a4f 100755
> > --- a/tests/kms-test-modeset.py
> > +++ b/tests/kms-test-modeset.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
> > index bef1f4990a10..19c3adaa601f 100755
> > --- a/tests/kms-test-pageflip.py
> > +++ b/tests/kms-test-pageflip.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
> > index ac4b4d0eb407..a7cc11113aa9 100755
> > --- a/tests/kms-test-planeposition.py
> > +++ b/tests/kms-test-planeposition.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
> > index a24dc1c0fb1e..806adb8c68a8 100755
> > --- a/tests/kms-test-routing.py
> > +++ b/tests/kms-test-routing.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
> >  
> >  import kmstest
> >  import pykms
> > diff --git a/tests/kmstest.py b/tests/kmstest.py
> > index 8a483d7b5259..f13e3fb7aa32 100755
> > --- a/tests/kmstest.py
> > +++ b/tests/kmstest.py
> > @@ -1,4 +1,6 @@
> >  #!/usr/bin/python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
> >  
> >  import collections.abc
> >  import errno

-- 
Regards,

Laurent Pinchart
